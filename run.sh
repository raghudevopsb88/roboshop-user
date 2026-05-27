#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

: "${MONGO_URL:?MONGO_URL is required}"
: "${JWT_SECRET:?JWT_SECRET is required}"
: "${USER_SERVER_PORT:?USER_SERVER_PORT is required}"

export MONGO_URL
export JWT_SECRET
export PORT="${USER_SERVER_PORT}"

exec node server.js
