#!/bin/bash
source "${SCRIPTSDIR}/helper-functions.sh"

TITLE=$1
MESSAGE=$2
COLOR=$3
URL=$4

DISCORD_URL="${URL:-${DISCORD_WEBHOOK_URL}}"

if [ "$(date +%H)" -lt 9 ]; then
    JSON=$(jo embeds[]="$(jo title="$TITLE" description="$MESSAGE" color="$COLOR")" flags=4096)
else
    JSON=$(jo embeds[]="$(jo title="$TITLE" description="$MESSAGE" color="$COLOR")")
fi

LogInfo "Sending Discord json: ${JSON}"
curl -sfSL -H "Content-Type: application/json" -d "$JSON" "$DISCORD_URL"
