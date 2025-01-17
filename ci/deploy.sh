#!/usr/bin/env bash

source ./ci/compute-env.sh

docker ps -a|awk '($0 ~ "comwork_wiki_prod"){system("docker rm -f "$1)}' || :
docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker compose -f "docker-compose-prod.yml" up -d --force-recreate "${SERVICE_NAME}"
