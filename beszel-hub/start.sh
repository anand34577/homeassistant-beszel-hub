#!/usr/bin/with-contenv bashio

set -e

bashio::log.info "Starting Beszel Hub..."

# Set data directory
export DATA_DIR=/data/beszel_data
mkdir -p "${DATA_DIR}"

# Read configuration options from Home Assistant
if bashio::config.has_value 'app_url'; then
    export APP_URL=$(bashio::config 'app_url')
    bashio::log.info "APP_URL configured"
fi

if bashio::config.has_value 'auto_login'; then
    export AUTO_LOGIN=$(bashio::config 'auto_login')
    bashio::log.info "AUTO_LOGIN configured"
fi

if bashio::config.has_value 'csp'; then
    export CSP=$(bashio::config 'csp')
    bashio::log.info "CSP configured"
fi

if bashio::config.has_value 'disable_password_auth'; then
    export DISABLE_PASSWORD_AUTH=$(bashio::config 'disable_password_auth')
    bashio::log.info "DISABLE_PASSWORD_AUTH: ${DISABLE_PASSWORD_AUTH}"
fi

if bashio::config.has_value 'mfa_otp'; then
    export MFA_OTP=$(bashio::config 'mfa_otp')
    bashio::log.info "MFA_OTP: ${MFA_OTP}"
fi

if bashio::config.has_value 'share_all_systems'; then
    export SHARE_ALL_SYSTEMS=$(bashio::config 'share_all_systems')
    bashio::log.info "SHARE_ALL_SYSTEMS: ${SHARE_ALL_SYSTEMS}"
fi

if bashio::config.has_value 'trusted_auth_header'; then
    export TRUSTED_AUTH_HEADER=$(bashio::config 'trusted_auth_header')
    bashio::log.info "TRUSTED_AUTH_HEADER configured"
fi

if bashio::config.has_value 'user_creation'; then
    export USER_CREATION=$(bashio::config 'user_creation')
    bashio::log.info "USER_CREATION: ${USER_CREATION}"
fi

if bashio::config.has_value 'user_email'; then
    export USER_EMAIL=$(bashio::config 'user_email')
    bashio::log.info "Initial admin user email configured"
fi

if bashio::config.has_value 'user_password'; then
    export USER_PASSWORD=$(bashio::config 'user_password')
    bashio::log.info "Initial admin user password configured"
fi

# Start Beszel Hub
bashio::log.info "Starting Beszel Hub on port 8090..."
exec /beszel serve --http=0.0.0.0:8090
