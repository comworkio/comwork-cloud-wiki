#!/usr/bin/env bash

source ./ci/compute-env.sh

slack_notif() {
    token="${1}"
    if [[ $token ]]; then
        message="${SLACK_USERNAME} has been successfully deployed! version = ${VERSION}"
        endpoint="https://hooks.slack.com/services/${token}"
        payload="{\"text\": \"${message}\", \"username\": \"${SLACK_USERNAME}\", \"channel\": \"${SLACK_CHANNEL}\", \"icon_emoji\": \"${SLACK_EMOJI}\"}"
        curl -X POST "${endpoint}" -H "Accept: application/json" -d "${payload}"
    fi
}

discord_notif() {
    token="${1}"
    if [[ $token ]]; then
        message="${SLACK_USERNAME} has been successfully deployed! version = ${VERSION}"
        endpoint="https://discord.com/api/webhooks/${token}/slack"
        payload="{\"text\": \"${message}\", \"username\": \"${SLACK_USERNAME}\"}"
        curl -X POST "${endpoint}" -H "Accept: application/json" -d "${payload}"
    fi
}

slack_notif "${SLACK_TOKEN}"
slack_notif "${SLACK_TOKEN_PUBLIC}"
discord_notif "${DISCORD_TOKEN_PUBLIC}"
