#!/usr/bin/env bash
set -e

if [ -f /data/params ]; then
    set -a
    # shellcheck disable=SC1091
    source /data/params
    set +a
fi

: "${MONGO_URL:?MONGO_URL is required}"

echo "Seeding MongoDB at ${MONGO_URL}..."
mongosh "$MONGO_URL" --file /db/master-data.js
echo "User database setup complete"
