#!/usr/bin/env bash

git pull origin "${CI_COMMIT_BRANCH}" || :

export IMAGE_NAME="comwork_cloud_doc"
export VERSION="${CI_COMMIT_BRANCH}-${CI_COMMIT_SHORT_SHA}"

# Slack
export SLACK_USERNAME="comwork_cloud_doc"
export SLACK_EMOJI=":comworkcloud:"
export SLACK_CHANNEL="#cloud"
