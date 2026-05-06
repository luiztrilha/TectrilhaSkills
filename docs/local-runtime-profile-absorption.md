# Local Runtime Profile Absorption

Last checked: 2026-05-06.

The public local-runtime-profile snapshot contains many Markdown files. This
guide records what was absorbed into TectrilhaSkills and what remains
reference-only.

## Answer

The files were not copied wholesale. They were absorbed as public-safe catalogs
and patterns.

## Source Groups

| Source Group | Markdown Count | Absorbed Into |
|---|---:|---|
| `claude-plugins` | 192 | [`../catalog/plugin-marketplaces.md`](../catalog/plugin-marketplaces.md), [`plugin-development-patterns.md`](plugin-development-patterns.md), [`mcp-usage-patterns.md`](mcp-usage-patterns.md) |
| `superpowers` | 68 | [`../catalog/skills.md`](../catalog/skills.md), [`../catalog/prompts-and-commands.md`](../catalog/prompts-and-commands.md), [`codex-agents-superpowers.md`](codex-agents-superpowers.md) |
| `agents-design` | 33 | [`../catalog/skills.md`](../catalog/skills.md) |
| `codex` | 32 | [`../catalog/skills.md`](../catalog/skills.md), [`../catalog/prompts-and-commands.md`](../catalog/prompts-and-commands.md) |
| `root-or-index` | 13 | [`runtime-profile-boundaries.md`](runtime-profile-boundaries.md), [`environment-usage-patterns.md`](environment-usage-patterns.md) |
| `claude-commands` | 8 | [`../catalog/prompts-and-commands.md`](../catalog/prompts-and-commands.md) |
| `opencode` | 6 | [`../catalog/skills.md`](../catalog/skills.md) |

## Promoted Concepts

- skill taxonomy across Codex, Agents, Superpowers, OpenCode, and plugin skills
- plugin manifest and component layout
- MCP integration patterns inside plugins
- command and prompt routing patterns
- code review, feature development, and PR review agent patterns
- hook safety and publishing checklist
- local-runtime-profile boundaries and exclusion rules

## Reference-Only Material

Keep these as reference-only unless separately vetted:

- third-party plugin source trees
- external service plugins for messaging or hosted integrations
- OpenCode/GitNexus implementation details
- historical plans, specs, tests, and release notes
- raw command prompt files that may carry upstream-specific assumptions

## Never Promote

- private memory snapshots
- session logs
- runtime databases
- raw config
- private approval rules
- tokens, credentials, cookies, OAuth state, or browser state
- live broker/company state
- machine-specific paths

## Maintenance Rule

When the profile snapshot changes, update this guide by:

1. listing new Markdown files
2. grouping them by source
3. deciding `cataloged`, `pattern-promoted`, `reference-only`, or `excluded`
4. updating the related catalog file
5. running a secret/path scan before publishing
