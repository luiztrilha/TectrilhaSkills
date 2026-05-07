# Coverage Check

Last checked: 2026-05-07.

Scope checked:

- Codex skills under the local Codex skill runtime
- Codex system skills
- Agents design skills
- Superpowers workflow skills
- MCP servers configured in the local Codex runtime
- MCP servers registered in the DunderIA MCP catalog
- Markdown files under the public local-runtime-profile snapshot
- Claude plugin marketplace material
- OpenCode/GitNexus skill references
- prompt, command, and agent orientation files
- repo-local and workspace-level guidance files from a broad environment scan
- repo-local skill folders and starter-kit skill folders
- public-safe Markdown patterns from the local environment
- external agent-forward repository template patterns

## Result

All known skills are represented in [`skills.md`](skills.md).

All known MCP server families are represented in [`mcps.md`](mcps.md).

The local-runtime-profile Markdown corpus is represented by:

- [`skills.md`](skills.md), for active and snapshot-only skills
- [`plugin-marketplaces.md`](plugin-marketplaces.md), for Claude/plugin marketplace material
- [`prompts-and-commands.md`](prompts-and-commands.md), for command and prompt patterns
- [`../docs/local-runtime-profile-absorption.md`](../docs/local-runtime-profile-absorption.md), for ingestion status

The broader environment scan is represented by:

- [`environment-scan.md`](environment-scan.md), for public-safe findings
- [`../docs/repository-guidance-patterns.md`](../docs/repository-guidance-patterns.md), for reusable repo guidance patterns
- [`repository-templates.md`](repository-templates.md), for public-safe starter template patterns
- [`skills.md`](skills.md), for newly discovered skill families

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

- [`../docs/agent-forward-repository-template.md`](../docs/agent-forward-repository-template.md)
- [`../docs/environment-usage-patterns.md`](../docs/environment-usage-patterns.md)
- [`../docs/mcp-usage-patterns.md`](../docs/mcp-usage-patterns.md)
- [`../docs/runtime-profile-boundaries.md`](../docs/runtime-profile-boundaries.md)
- [`../docs/windows-powershell-recipes.md`](../docs/windows-powershell-recipes.md)
- [`../AGENTS.md`](../AGENTS.md)

Private or machine-specific Markdown files were not copied wholesale. Their
reusable policies were summarized instead.

## Local Runtime Profile Snapshot Coverage

Checked Markdown groups:

| Group | Count | Treatment |
|---|---:|---|
| `claude-plugins` | 192 | cataloged and summarized as plugin marketplace patterns |
| `superpowers` | 68 | active skills cataloged; extra plans/specs summarized as workflow references |
| `agents-design` | 33 | active design skills cataloged |
| `codex` | 32 | active skills, prompts, commands, and orientation summarized |
| `root-or-index` | 13 | safety and boundary rules summarized |
| `claude-commands` | 8 | cataloged as command wrappers |
| `opencode` | 6 | cataloged as GitNexus/OpenCode references |

## Broader Environment Scan Coverage

Checked public-safe categories:

| Category | Treatment |
|---|---|
| repo `AGENTS.md` and runtime instruction files | summarized as instruction precedence and repo bootstrap patterns |
| `docs/agent-workspace/` folders | summarized as agent workspace bundle pattern |
| workspace-level `docs/agent-harness/` material | summarized as operational harness pattern |
| OpenSpec folders and skill family | cataloged as artifact-driven change workflow |
| repo-local `.agents`, `.codex`, and `.claude` skills | cataloged when reusable; excluded when private |
| design/performance rule packs | cataloged as reference-only rule packs |
| external `codex-repo-template` style repos | summarized as agent-forward repository starter guidance; unsafe runtime config excluded |

## Current Gap

The repo is a guide and catalog, not a mirror of every installed skill source.
Before copying any full skill source, vet licensing, private paths, scripts,
assets, and runtime assumptions.
