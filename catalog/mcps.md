# MCP Catalog

Last checked: 2026-05-06.

This catalog records the public-safe view of MCP servers used or registered in
the local environment. It intentionally documents patterns and purposes, not raw
runtime config.

## Status Legend

- `active-codex`: enabled in the local Codex runtime
- `registered-dunderia`: present in the DunderIA MCP catalog
- `optional-gated`: available only when the matching provider or credential is configured
- `disabled-reference`: configured as a reference but disabled by default
- `private-state`: uses local state and must not be published as data

## Servers

| MCP | Status | Purpose | Public Notes |
|---|---|---|---|
| `serena` | `active-codex` | Semantic code navigation and project-aware editing support. | Publish usage guidance only; do not publish local runtime install paths or project cache. |
| `github` | `active-codex`, `registered-dunderia` | GitHub repository, issue, pull request, code search, and file operations. | Use a launcher that reads tokens from environment or a trusted CLI. Never commit tokens. |
| `playwright` | `active-codex`, `registered-dunderia` | Browser automation, snapshots, screenshots, forms, console logs, and UI debugging. | Prefer isolated/headless sessions for automation. Treat screenshots and captured pages as potentially sensitive. |
| `filesystem` | `active-codex`, `registered-dunderia` | Scoped local file access for allowed roots. | Use explicit allowlists. Keep public examples on placeholder paths. Avoid broad home-directory access. |
| `brave-search` | `registered-dunderia`, `optional-gated` | Web search through Brave Search MCP. | Enable only when the configured search provider is Brave and an API key is available. Do not publish keys. |
| `megamemory` | `registered-dunderia`, `disabled-reference`, `private-state` | Per-repo persistent knowledge databases. | Catalog the pattern only. Do not publish `.megamemory` databases, memory contents, or project-specific DB paths. |

## Package Families Observed

| Family | Public Package Pattern | Notes |
|---|---|---|
| GitHub MCP | `@modelcontextprotocol/server-github` | Prefer pinned package versions in launchers. |
| Playwright MCP | `@playwright/mcp` | Use isolated mode for browser automation where possible. |
| Brave Search MCP | `@modelcontextprotocol/server-brave-search` | Requires a provider check and API key. |
| Filesystem MCP | `@modelcontextprotocol/server-filesystem` | Requires explicit root allowlists. |
| MegaMemory MCP | `megamemory` | Uses local database paths; keep data private. |
| Serena MCP | local Serena runtime | Local semantic tooling; publish setup concepts, not private runtime folders. |

## Tool Approval Patterns

Public-safe approval ideas:

- Read-only discovery tools can be auto-approved when the runtime supports that
  and the data source is already intended for the task.
- Write or edit tools should require explicit approval or a narrow repo-local
  policy.
- Browser actions that submit forms, upload files, or mutate state should be
  treated as write actions.
- Filesystem write/edit tools should be scoped to trusted workspace roots.

## Do Not Publish

- raw MCP config files
- OAuth state, API keys, tokens, cookies, or CLI auth output
- local memory databases
- broker or company state
- private filesystem allowlists
- machine-specific launcher paths
- captured browser data from private sessions
