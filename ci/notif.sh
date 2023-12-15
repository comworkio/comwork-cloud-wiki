#!/usr/bin/env bash

source ./ci/compute-env.sh

discord_notif() {
    token="${1}"
    if [[ $token ]]; then
        message="${DISCORD_USERNAME} has been successfully deployed! version = ${VERSION}"
        endpoint="https://discord.com/api/webhooks/${token}/slack"
        payload="{\"text\": \"${message}\", \"username\": \"${DISCORD_USERNAME}\"}"
        curl -X POST "${endpoint}" -H "Accept: application/json" -d "${payload}"
    fi
}

discord_notif "${DISCORD_TOKEN_PUBLIC}"
