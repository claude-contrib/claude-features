#!/bin/bash
set -e

source dev-container-features-test-lib

check "claude is installed" bash -c "claude --version"
check "ripgrep is installed" bash -c "rg --version"
check "defaultMode is bypassPermissions" bash -c "cat \$HOME/.claude/settings.json | grep '\"defaultMode\": \"bypassPermissions\"'"
check "autoUpdaterStatus is disabled" bash -c "cat \$HOME/.claude/settings.json | grep '\"autoUpdaterStatus\": \"disabled\"'"
check "includeCoAuthoredBy is false" bash -c "cat \$HOME/.claude/settings.json | grep '\"includeCoAuthoredBy\": false'"

reportResults
