#!/usr/bin/env bash

docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker-compose -f "docker-compose-prod.yml" up -d --force-recreate
