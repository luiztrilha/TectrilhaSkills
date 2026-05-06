# TectrilhaSkills

Public guide for designing, reviewing, installing, and operating agent skills.

This repository is a handbook, not a runtime snapshot. It explains reusable
patterns for Codex, Agents, and Superpowers style skills without exposing local
machine state, memories, sessions, secrets, broker state, or private project
helpers.

## What Is Here

- `docs/`: practical guidance for using and maintaining skills
- `catalog/`: public notes about reusable skills and when to use them
- `templates/`: safe starting points for new skills
- `examples/`: small public examples that can be copied or adapted

## What Is Not Here

This repo must not contain:

- tokens, credentials, OAuth state, browser profiles, or raw config files
- runtime memories, session logs, shell history, telemetry, or local databases
- private project helpers, database scripts, company state, or broker state
- machine-specific paths that only work on one workstation
- broad exports of a live runtime profile

## Recommended Workflow

1. Decide whether the behavior belongs in a skill, a repo rule, or normal docs.
2. Draft the skill with a narrow trigger and a clear output contract.
3. Vet the files for secrets, local paths, and risky commands.
4. Test the skill in a disposable local runtime or a small repo fixture.
5. Promote only the reusable parts.

## Update Rule

Keep this repository current whenever reusable skill knowledge changes in a
public repo or in the global Codex/Agents/Superpowers environment. Promote the
public-safe pattern, not the private runtime artifact.

## Start Here

- [Skill anatomy](docs/skill-anatomy.md)
- [Installing skills](docs/installing-skills.md)
- [Creating public skills](docs/creating-public-skills.md)
- [Vetting skills](docs/vetting-skills.md)
- [Codex, Agents, and Superpowers](docs/codex-agents-superpowers.md)
- [Environment usage patterns](docs/environment-usage-patterns.md)
- [Runtime profile boundaries](docs/runtime-profile-boundaries.md)
- [MCP usage patterns](docs/mcp-usage-patterns.md)
- [Windows PowerShell recipes](docs/windows-powershell-recipes.md)
- [Skill catalog](catalog/skills.md)
- [MCP catalog](catalog/mcps.md)
- [Coverage check](catalog/coverage-check.md)

## Relationship To DunderIA

`dunderia-public-export` can point here for reusable skill guidance. Runtime
profile snapshots should stay small and sanitized; this repository carries the
long-form guidance instead.
