# claude-features

Devcontainer features for Claude Code and Anthropic tools.

## Features

| Feature | Description |
|---------|-------------|
| [claude-code](src/claude-code/README.md) | Installs the Claude Code CLI (claude) from Anthropic |

## Usage

Add to your `devcontainer.json`:

```json
{
    "features": {
        "ghcr.io/claude-contrib/claude-features/claude-code:1": {}
    }
}
```

### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `defaultMode` | string | `bypassPermissions` | Default permissions mode for Claude Code |

#### `defaultMode` values

| Value | Description |
|-------|-------------|
| `bypassPermissions` | Skips all permission prompts — suitable for devcontainer / CI environments |
| `acceptEdits` | Automatically accepts file edit permissions for the session |
| `plan` | Plan Mode: Claude can analyze but not modify files or execute commands |
| `dontAsk` | Auto-denies tools unless pre-approved via `/permissions` or `permissions.allow` rules |
