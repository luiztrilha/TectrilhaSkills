# Coverage Check

Last checked: 2026-05-06.

Scope checked:

- Codex skills under the local Codex skill runtime
- Codex system skills
- Agents design skills
- Superpowers workflow skills
- MCP servers configured in the local Codex runtime
- MCP servers registered in the DunderIA MCP catalog
- public-safe Markdown patterns from the local environment

## Result

All known skills are represented in [`skills.md`](skills.md).

All known MCP server families are represented in [`mcps.md`](mcps.md).

Included as source example:

- `examples/caveman/SKILL.md`

Cataloged as public guidance:

- Codex workflow skills
- Codex system skills
- Agents design skills
- Superpowers workflow skills

Intentionally excluded from source promotion:

- `sql-convenios`, because it is a private database workflow helper
- raw runtime config
- memory files and session logs
- browser state, telemetry, shell history, and local databases
- live broker or company state
- private project procedures and machine-specific paths

## Markdown Pattern Coverage

Public-safe patterns were promoted into:

- [`../docs/environment-usage-patterns.md`](../docs/environment-usage-patterns.md)
- [`../docs/mcp-usage-patterns.md`](../docs/mcp-usage-patterns.md)
- [`../docs/runtime-profile-boundaries.md`](../docs/runtime-profile-boundaries.md)
- [`../docs/windows-powershell-recipes.md`](../docs/windows-powershell-recipes.md)
- [`../AGENTS.md`](../AGENTS.md)

Private or machine-specific Markdown files were not copied wholesale. Their
reusable policies were summarized instead.

## Current Gap

The repo is a guide and catalog, not a mirror of every installed skill source.
Before copying any full skill source, vet licensing, private paths, scripts,
assets, and runtime assumptions.
