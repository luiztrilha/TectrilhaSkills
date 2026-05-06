# MCP Usage Patterns

MCP servers extend an agent's reach. Treat them as capability boundaries, not as
plain documentation.

## Public Configuration Shape

Public docs can show a sanitized shape:

```json
{
  "mcpServers": {
    "github": {
      "command": "powershell.exe",
      "args": ["-NoProfile", "-File", "${workspaceFolder}/scripts/launch_github_mcp.ps1"]
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "<WORKSPACE_ROOT>"]
    }
  }
}
```

Do not publish a real local config file. Replace paths, credentials, provider
settings, and database locations with placeholders.

## Launcher Pattern

A safe launcher should:

- set strict error handling
- allow package override through environment variables
- read credentials from environment or a trusted local CLI
- fail closed when credentials or provider settings are missing
- avoid printing secrets
- pin package versions when stability matters

## Filesystem MCP

Use the narrowest workable allowlist:

- one repo root for repo tasks
- a skill directory when working on skills
- a temporary/output directory for generated artifacts

Avoid broad user-home or drive-root access in public examples.

## Browser MCP

Browser MCP sessions can expose private page content. Use them carefully:

- prefer isolated sessions
- capture only what the task requires
- do not publish screenshots containing private data
- treat form submission, upload, and navigation into authenticated apps as
  stateful actions

## GitHub MCP

Prefer a dedicated token or trusted CLI auth. Public docs should name required
permission categories, not publish token values.

Common read operations:

- repository search
- file contents
- code search
- commit lists

Common write operations:

- create or update files
- create issues or pull requests
- review or merge pull requests

Write operations should remain explicit and scoped.

## Web Search MCP

Gate web-search MCPs by provider setting and credential availability. If the
provider is not selected, the launcher should fail closed instead of silently
falling back to another source.

## Memory MCP

Memory MCPs can be useful for per-repo knowledge, but their databases are private
state. Publish the workflow pattern only:

- one database per repo or domain
- clear ownership of the memory store
- no wholesale publication of memory contents
- no customer or credential data

## Verification

Before documenting or changing MCP usage:

1. inspect active runtime config
2. inspect repo MCP catalog or launcher scripts
3. classify each server as active, optional, disabled, or private-state
4. document sanitized guidance only
5. run a secret/path scan on the public repo diff
