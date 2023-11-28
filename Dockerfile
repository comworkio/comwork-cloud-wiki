ARG NODE_VERSION=18.0.0-alpine
ARG NGINX_VERSION=1.15

# Stage build
FROM node:${NODE_VERSION} AS doc_builder

RUN npx create-docusaurus@latest comwork-cloud-wiki classic
WORKDIR /comwork-cloud-wiki

RUN rm -rf docs/* && rm -rf blog/*

COPY .docker/docusaurus/docusaurus.config.js .
COPY img/comwork_logo.png static/img/comwork_logo.png
COPY img/favicon.ico static/img/favicon.ico
COPY .docker/docusaurus/custom.css src/css/custom.css
COPY .docker/docusaurus/index.js src/pages/index.js

COPY . docs/

RUN rm -rf docs/ci && \
    apk add curl && \
    npm i --save docusaurus-plugin-matomo  && \
    npm i --save @docusaurus/plugin-client-redirects && \
    npm i --save docusaurus-lunr-search@2.1.15 && \
    npm run swizzle docusaurus-lunr-search SearchBar -- --danger && \
    npm i  && \
    npm run build

# Stage run
FROM nginx:${NGINX_VERSION} AS doc

COPY .docker/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY .docker/nginx/docker-entrypoint.sh /docker-entrypoint.sh

COPY --from=doc_builder /comwork-cloud-wiki/build/ /usr/share/nginx/html

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "nginx", "-g","daemon off;" ]
