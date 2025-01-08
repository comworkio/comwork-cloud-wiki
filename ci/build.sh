#!/usr/bin/env bash

set -e
set -x

source ./ci/compute-env.sh

if ! docker-compose -f docker-compose-build.yml build "${SERVICE_NAME}"; then
    echo "Docker build failed - likely due to documentation build error"
    docker-compose -f docker-compose-build.yml logs "${SERVICE_NAME}"
    exit 1
fi
