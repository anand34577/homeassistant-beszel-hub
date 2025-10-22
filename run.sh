#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

bashio::log.info "Starting Beszel Hub..."

# Parse configuration from options.json
APP_URL=$(bashio::config 'app_url')
AUTO_LOGIN=$(bashio::config 'auto_login')
CSP=$(bashio::config 'csp')
DISABLE_PASSWORD_AUTH=$(bashio::config 'disable_password_auth')
MFA_OTP=$(bashio::config 'mfa_otp')
SHARE_ALL_SYSTEMS=$(bashio::config 'share_all_systems')
TRUSTED_AUTH_HEADER=$(bashio::config 'trusted_auth_header')
USER_CREATION=$(bashio::config 'user_creation')
USER_EMAIL=$(bashio::config 'user_email')
USER_PASSWORD=$(bashio::config 'user_password')

# Export environment variables with BESZEL_HUB_ prefix
export BESZEL_DATA_DIR="/data/beszel_data"

# Create data directory if it doesn't exist
mkdir -p "${BESZEL_DATA_DIR}"

# Set optional environment variables only if they are configured
if [ -n "${APP_URL}" ]; then
    export BESZEL_HUB_APP_URL="${APP_URL}"
    bashio::log.info "APP_URL set to: ${APP_URL}"
fi

if [ -n "${AUTO_LOGIN}" ]; then
    export BESZEL_HUB_AUTO_LOGIN="${AUTO_LOGIN}"
    bashio::log.warning "AUTO_LOGIN enabled - bypassing authentication!"
fi

if [ -n "${CSP}" ]; then
    export BESZEL_HUB_CSP="${CSP}"
    bashio::log.info "CSP header configured"
fi

if bashio::config.true 'disable_password_auth'; then
    export BESZEL_HUB_DISABLE_PASSWORD_AUTH="true"
    bashio::log.info "Password authentication disabled"
fi

if [ "${MFA_OTP}" != "false" ] && [ -n "${MFA_OTP}" ]; then
    export BESZEL_HUB_MFA_OTP="${MFA_OTP}"
    bashio::log.info "MFA OTP enabled: ${MFA_OTP}"
fi

if bashio::config.true 'share_all_systems'; then
    export BESZEL_HUB_SHARE_ALL_SYSTEMS="true"
    bashio::log.info "All systems shared with all users"
fi

if [ -n "${TRUSTED_AUTH_HEADER}" ]; then
    export BESZEL_HUB_TRUSTED_AUTH_HEADER="${TRUSTED_AUTH_HEADER}"
    bashio::log.info "Trusted auth header configured: ${TRUSTED_AUTH_HEADER}"
fi

if bashio::config.true 'user_creation'; then
    export BESZEL_HUB_USER_CREATION="true"
    bashio::log.info "Automatic user creation enabled"
fi

if [ -n "${USER_EMAIL}" ]; then
    export BESZEL_HUB_USER_EMAIL="${USER_EMAIL}"
    bashio::log.info "First user email: ${USER_EMAIL}"
fi

if [ -n "${USER_PASSWORD}" ]; then
    export BESZEL_HUB_USER_PASSWORD="${USER_PASSWORD}"
    bashio::log.info "First user password configured"
fi

# Log startup information
bashio::log.info "Beszel Hub data directory: ${BESZEL_DATA_DIR}"
bashio::log.info "Web UI will be available on port 8090"

# Start Beszel Hub (adjust the command based on actual beszel binary location)
exec /app/beszel serve --http=0.0.0.0:8090
