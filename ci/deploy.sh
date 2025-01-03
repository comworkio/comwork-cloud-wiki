#!/usr/bin/env bash

source ./ci/compute-env.sh

docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker compose -f "docker-compose-prod.yml" up -d --force-recreate "${SERVICE_NAME}"
