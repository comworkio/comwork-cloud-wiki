ARG NODE_VERSION=16.14.2-alpine
ARG NGINX_VERSION=1.15

# Stage build
FROM node:${NODE_VERSION} AS doc_builder

RUN npx create-docusaurus@latest comwork-cloud-wiki classic

WORKDIR /comwork-cloud-wiki

RUN rm -rf docs/* && rm -rf blog/*

COPY .docker/docusaurus/docusaurus.config.js .
COPY img/comwork_logo.png static/img/comwork_logo.png
COPY img/favicon.ico static/img/favicon.ico
COPY .docker/docusaurus/custom.css static/css/custom.css

COPY . docs/
COPY README.md docs/intro.md

RUN npm i && npm run build

# Stage run
FROM nginx:${NGINX_VERSION} AS doc

COPY .docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY .docker/nginx/docker-entrypoint.sh /docker-entrypoint.sh

COPY --from=doc_builder /comwork-cloud-wiki/build/ /usr/share/nginx/html

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "nginx", "-g","daemon off;" ]