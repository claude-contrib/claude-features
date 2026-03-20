# Claude Features

> One line in `devcontainer.json`. Claude Code, ready to go.

[![Test](https://github.com/claude-contrib/claude-features/actions/workflows/test.yaml/badge.svg)](https://github.com/claude-contrib/claude-features/actions/workflows/test.yaml)
[![Validate](https://github.com/claude-contrib/claude-features/actions/workflows/validate.yml/badge.svg)](https://github.com/claude-contrib/claude-features/actions/workflows/validate.yml)
[![Release](https://img.shields.io/github/v/release/claude-contrib/claude-features)](https://github.com/claude-contrib/claude-features/releases/latest)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

Stop setting up Claude Code by hand. Drop a feature reference into your `devcontainer.json` and every teammate, Codespace, and CI run gets the same Claude CLI — installed, configured, and ready on first boot.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) (`docker`)
- [devcontainer CLI](https://github.com/devcontainers/cli) (`devcontainer`) _(or VS Code Dev Containers)_

**macOS (Homebrew):**

```bash
brew install --cask docker
npm install -g @devcontainers/cli
```

## Quickstart

Add to your `devcontainer.json`:

```json
{
    "features": {
        "ghcr.io/claude-contrib/claude-features/claude-code:1": {}
    }
}
```

Claude Code is installed and configured automatically when the container builds. The default permissions mode is set to `bypassPermissions` — appropriate for ephemeral devcontainer environments.

## Available Features

| Feature | Description |
|---------|-------------|
| [`claude-code`](src/claude-code/README.md) | Installs the Claude Code CLI (`claude`) from Anthropic |

## The claude-contrib Ecosystem

| Repo | What it provides |
|------|-----------------|
| [claude-extensions](https://github.com/claude-contrib/claude-extensions) | Hooks, context rules, session automation |
| **claude-features** ← you are here | Devcontainer features for Claude Code and Anthropic tools |
| [claude-languages](https://github.com/claude-contrib/claude-languages) | LSP language servers — completions, diagnostics, hover |
| [claude-sandbox](https://github.com/claude-contrib/claude-sandbox) | Sandboxed Docker environment for Claude Code |
| [claude-services](https://github.com/claude-contrib/claude-services) | MCP servers — browser, filesystem, sequential thinking |
| [claude-status](https://github.com/claude-contrib/claude-status) | Live status line — context, cost, model, branch, worktree |

## License

MIT — use it, fork it, extend it.
