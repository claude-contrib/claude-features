#!/bin/sh
set -e

echo "Installing ripgrep..."

if command -v apt-get > /dev/null 2>&1; then
    apt-get update -y
    apt-get install -y ripgrep
elif command -v apk > /dev/null 2>&1; then
    apk add --no-cache ripgrep
elif command -v dnf > /dev/null 2>&1; then
    dnf install -y ripgrep
else
    echo "ERROR: No supported package manager found (apt, apk, dnf)."
    exit 1
fi

echo "Installing Claude Code CLI..."

curl -fsSL https://claude.ai/install.sh | bash

# Make claude available system-wide
PATH="$HOME/.local/bin:$PATH"
if ! command -v claude > /dev/null 2>&1; then
    echo "ERROR: claude binary not found after install"
    exit 1
fi
cp "$(command -v claude)" /usr/local/bin/claude

# Also place the binary at the remote user's ~/.local/bin so Claude's native
# install method check does not warn that the binary is missing there
REMOTE_USER_LOCAL_BIN="${_REMOTE_USER_HOME}/.local/bin"
mkdir -p "${REMOTE_USER_LOCAL_BIN}"
cp /usr/local/bin/claude "${REMOTE_USER_LOCAL_BIN}/claude"
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${REMOTE_USER_LOCAL_BIN}"

echo "Installed $(claude --version)"

echo "Configuring Claude Code settings..."
CLAUDE_SETTINGS_DIR="${_REMOTE_USER_HOME}/.claude"
mkdir -p "${CLAUDE_SETTINGS_DIR}"
cat > "${CLAUDE_SETTINGS_DIR}/settings.json" << EOF
{
  "permissions": {
    "defaultMode": "bypassPermissions"
  },
  "autoUpdaterStatus": "disabled",
  "includeCoAuthoredBy": false
}
EOF
chown -R "${_REMOTE_USER}:${_REMOTE_USER}" "${CLAUDE_SETTINGS_DIR}" 2>/dev/null || true
