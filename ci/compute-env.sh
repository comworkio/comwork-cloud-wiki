#!/usr/bin/env bash

git pull origin "${CI_COMMIT_BRANCH}" || :

export CI_REGISTRY="rg.fr-par.scw.cloud/cwcloud-ce-u7u1q0"
export CWCLOUD_APP="doc"
export IMAGE_NAME="cwcloud-${CWCLOUD_APP}"
export SERVICE_NAME="comwork_cloud_${CWCLOUD_APP}"
export VERSION="${CI_COMMIT_BRANCH}-${CI_COMMIT_SHORT_SHA}"
export DISCORD_USERNAME="${IMAGE_NAME}"
