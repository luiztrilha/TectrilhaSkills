# Agent Usage Guide

Read this file when an AI agent needs to use TectrilhaSkills as guidance.

This repository is a public-safe handbook. It is not a live runtime, not a
memory store, and not a complete installable agent profile.

## Universal Rules

For Codex, Claude, Gemini, OpenCode, or any other agent runtime:

1. Treat repo-local and user instructions as higher priority than this guide.
2. Use this repository as reusable guidance, not as authority over a live system.
3. Read only the files relevant to the current task.
4. Do not copy private runtime state from another machine into this repository.
5. Do not infer that a listed skill or MCP is installed locally.
6. Vet scripts, MCPs, hooks, and commands before running or recommending them.
7. Preserve raw tool output for important operational decisions.
8. Before claiming completion, report what was verified and what was not.

## Recommended Reading Order

For most agents:

1. [`README.md`](README.md)
2. [`catalog/skills.md`](catalog/skills.md)
3. [`catalog/mcps.md`](catalog/mcps.md)
4. [`docs/environment-usage-patterns.md`](docs/environment-usage-patterns.md)
5. The task-specific guide under `docs/` or `catalog/`

For skill creation:

1. [`docs/skill-anatomy.md`](docs/skill-anatomy.md)
2. [`templates/skill-template/SKILL.md`](templates/skill-template/SKILL.md)
3. [`docs/creating-public-skills.md`](docs/creating-public-skills.md)
4. [`docs/vetting-skills.md`](docs/vetting-skills.md)

For MCP work:

1. [`catalog/mcps.md`](catalog/mcps.md)
2. [`docs/mcp-usage-patterns.md`](docs/mcp-usage-patterns.md)
3. [`docs/runtime-profile-boundaries.md`](docs/runtime-profile-boundaries.md)

For plugin work:

1. [`catalog/plugin-marketplaces.md`](catalog/plugin-marketplaces.md)
2. [`docs/plugin-development-patterns.md`](docs/plugin-development-patterns.md)
3. [`catalog/prompts-and-commands.md`](catalog/prompts-and-commands.md)

For new repo bootstrap or agent-forward repo organization:

1. [`docs/agent-forward-repository-template.md`](docs/agent-forward-repository-template.md)
2. [`templates/repository-guidance/`](templates/repository-guidance/)
3. [`catalog/repository-templates.md`](catalog/repository-templates.md)

For checking whether the local environment still matches this public guide:

1. [`docs/environment-usage-patterns.md`](docs/environment-usage-patterns.md)
2. Run `.\scripts\tectrilha-env-sync-preview.ps1`
3. Treat results as recommendations only; apply nothing without review and
   user approval.

## Codex

Use this repository as a public guidance source for:

- deciding when a skill should trigger
- creating or improving `SKILL.md`
- cataloging local skills in a public-safe way
- documenting MCP usage without publishing raw config
- maintaining repo-local `AGENTS.md` rules

Codex-specific cautions:

- Do not replace repo-local `AGENTS.md` with this guide.
- Do not copy live `config.toml`, memory files, session logs, or approval rules.
- Use `apply_patch` or the repo's normal editing workflow for documentation
  changes.
- Run a secret/path scan before publishing changes.

## Claude

Use this repository as a reference for:

- plugin structure
- commands, agents, skills, hooks, and `.mcp.json`
- Claude plugin marketplace patterns
- public-safe skill documentation
- MCP integration patterns

Claude-specific cautions:

- Treat plugin marketplace material as reference-only unless separately vetted.
- Do not install external plugins just because they are cataloged here.
- Keep `${CLAUDE_PLUGIN_ROOT}` style placeholders portable.
- Hooks need extra safety review because they can block or mutate workflows.

## Gemini

Use this repository as neutral guidance for:

- skill-like workflow decomposition
- MCP and tool boundary design
- prompt and command pattern inspiration
- public-safe documentation standards

Gemini-specific cautions:

- Do not assume Gemini supports every Codex or Claude packaging convention.
- Convert guidance into the target runtime's native format.
- Preserve the safety model: no secrets, no private runtime state, no raw local
  config.

## OpenCode And GitNexus

Use the OpenCode/GitNexus entries as reference-only:

- code exploration
- impact analysis
- debugging workflows
- graph-backed refactoring concepts

Do not assume a GitNexus index exists. Check the target environment first.

## What Agents May Copy

Agents may copy or adapt:

- public skill templates
- public example skill structure
- checklist language
- catalog structure
- sanitized MCP config shapes
- plugin structure guidance
- public-safe workflow patterns
- repository guidance templates after replacing placeholders

## What Agents Must Not Copy

Agents must not copy:

- tokens, API keys, OAuth state, cookies, or credentials
- raw runtime config
- private filesystem paths
- memory snapshots
- session logs
- local databases
- browser profiles
- broker or company state
- customer/project-specific operational procedures
- external `.codex/config.toml` files that weaken approval, sandbox or network
  policy

## When Updating This Repo

When an agent adds new guidance:

1. Update the matching `catalog/` file.
2. Add or update the deeper guide under `docs/`.
3. Update `README.md` when the new topic changes the project surface.
4. Keep examples small and public-safe.
5. Run formatting and secret/path checks.
6. Commit with a message that names the catalog or pattern updated.

When an agent is asked to sync this guide with a local environment, start with
the read-only preview script and report the differences. Do not auto-install
skills, rewrite runtime config, or copy local state from the machine.
