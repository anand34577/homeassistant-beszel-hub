#!/bin/bash
set -e

CONFIG=/data/options.json

export APP_URL=$(jq -r '.app_url // ""' $CONFIG)
export AUTO_LOGIN=$(jq -r '.auto_login // ""' $CONFIG)
export CSP=$(jq -r '.csp // ""' $CONFIG)
export DISABLE_PASSWORD_AUTH=$(jq -r '.disable_password_auth // false' $CONFIG)
export MFA_OTP=$(jq -r '.mfa_otp // false' $CONFIG)
export SHARE_ALL_SYSTEMS=$(jq -r '.share_all_systems // false' $CONFIG)
export TRUSTED_AUTH_HEADER=$(jq -r '.trusted_auth_header // ""' $CONFIG)
export USER_CREATION=$(jq -r '.user_creation // false' $CONFIG)
export USER_EMAIL=$(jq -r '.user_email // ""' $CONFIG)
export USER_PASSWORD=$(jq -r '.user_password // ""' $CONFIG)

exec /beszel serve