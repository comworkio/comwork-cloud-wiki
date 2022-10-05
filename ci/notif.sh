#!/usr/bin/env bash

source ./ci/compute-env.sh

slack_notif() {
    token="${1}"
    if [[ $token ]]; then
        message="${SLACK_USERNAME} has been sucessfuly deployed! version = ${VERSION}"
        endpoint="https://hooks.slack.com/services/${token}"
        payload="{\"text\": \"${message}\", \"username\": \"${SLACK_USERNAME}\", \"channel\": \"${SLACK_CHANNEL}\", \"icon_emoji\": \"${SLACK_EMOJI}\"}"
        curl -X POST "${endpoint}" -H "Accept: application/json" -d "${payload}"
    fi
}

slack_notif "${SLACK_TOKEN}"
slack_notif "${SLACK_TOKEN_PUBLIC}"
