#!/bin/sh
set -e

# Set data directory
export DATA_DIR=/data/beszel_data
mkdir -p "${DATA_DIR}"

# Only set environment variables if they have actual values
if [ -n "$USER_EMAIL" ] && [ "$USER_EMAIL" != "" ]; then
    export USER_EMAIL="$USER_EMAIL"
fi

if [ -n "$USER_PASSWORD" ] && [ "$USER_PASSWORD" != "" ]; then
    export USER_PASSWORD="$USER_PASSWORD"
fi

if [ -n "$APP_URL" ] && [ "$APP_URL" != "" ]; then
    export APP_URL="$APP_URL"
fi

if [ -n "$AUTO_LOGIN" ] && [ "$AUTO_LOGIN" != "" ]; then
    export AUTO_LOGIN="$AUTO_LOGIN"
fi

if [ -n "$CSP" ] && [ "$CSP" != "" ]; then
    export CSP="$CSP"
fi

if [ -n "$TRUSTED_AUTH_HEADER" ] && [ "$TRUSTED_AUTH_HEADER" != "" ]; then
    export TRUSTED_AUTH_HEADER="$TRUSTED_AUTH_HEADER"
fi

# Start Beszel Hub
exec /beszel serve --http=0.0.0.0:8090
