## Configuration

The add-on can be configured through the Configuration tab. All options are optional.

### Basic Options

**user_email** (string, optional)

- Email address for the initial admin user
- If not set, you'll create an account on first access

**user_password** (password, optional)

- Password for the initial admin user
- Must be set if user_email is provided

### Advanced Options

**app_url** (string, optional)

- URL of the web UI
- Must set if serving at a subpath
- Example: `https://yourdomain.com/beszel`

**disable_password_auth** (boolean, default: false)

- Disables password authentication
- Use this if you want OAuth-only authentication
- Note: This doesn't disable authentication entirely

**share_all_systems** (boolean, default: false)

- Makes all systems visible to all users
- Users can edit or delete any system unless they have the `readonly` role

**auto_login** (email, optional)

- Email address of a user to automatically authenticate
- ⚠️ Warning: This bypasses authentication completely
- Only use for single-user setups

**csp** (string, optional)

- Adds a Content-Security-Policy header with this value

**mfa_otp** (list: false|true|superusers, optional)

- Enables multi-factor authentication via email one-time password
- Options:
  - `false`: Disabled (default)
  - `true`: Enabled for all users
  - `superusers`: Enabled only for superusers
- ⚠️ Requires SMTP configuration

**trusted_auth_header** (string, optional)

- Trusted header for forwarded authentication
- Example: `Cf-Access-Authenticated-User-Email` for Cloudflare Access
- ⚠️ Only use with proper authentication proxy

**user_creation** (boolean, default: false)

- Enables automatic user creation for OAuth2 / OIDC
