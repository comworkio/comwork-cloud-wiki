#!/usr/bin/env bash

set -e
set -x

source ./ci/compute-env.sh

docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker tag "${IMAGE_NAME}:latest" "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"
docker push "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"
