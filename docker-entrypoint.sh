#!/bin/sh
set -eu

if [ -n "${PORT:-}" ]; then
	export PICOCLAW_GATEWAY_PORT="${PICOCLAW_GATEWAY_PORT:-$PORT}"
	export PICOCLAW_CHANNELS_MAIXCAM_PORT="${PICOCLAW_CHANNELS_MAIXCAM_PORT:-$PORT}"
	export PICOCLAW_CHANNELS_LINE_WEBHOOK_PORT="${PICOCLAW_CHANNELS_LINE_WEBHOOK_PORT:-$PORT}"
fi

CONFIG_PATH="${HOME:-/root}/.picoclaw/config.json"
if [ ! -f "$CONFIG_PATH" ]; then
	picoclaw onboard >/dev/null
fi

if [ "$#" -eq 0 ]; then
	set -- gateway
fi

exec picoclaw "$@"
