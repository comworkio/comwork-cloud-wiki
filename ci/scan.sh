#!/usr/bin/env bash

source ./ci/compute-env.sh

echo "Pulling recent built image"
docker login "${CI_REGISTRY}" --username "${CI_REGISTRY_USER}" --password "${CI_REGISTRY_PASSWORD}"
docker pull "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"

echo "Scanning recent build image"
trivy image \
--exit-code ${CI_SCAN_EXIT_CODE} \
--severity ${CI_SCAN_SEVERITY} "${CI_REGISTRY}/${IMAGE_NAME}:${VERSION}"
