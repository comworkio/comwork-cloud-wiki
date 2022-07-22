#!/usr/bin/env bash

docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker-compose -f docker-compose-build.yml build  "${IMAGE_NAME}"
docker tag "${IMAGE_NAME}:latest" "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"
docker push "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"
