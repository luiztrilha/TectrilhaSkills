# TectrilhaSkills

Public guide for designing, reviewing, installing, and operating agent skills,
MCPs, plugin patterns, prompts, commands, and reusable agent workflows.

This repository is a handbook, not a runtime snapshot. It explains reusable
patterns for Codex, Agents, and Superpowers style skills without exposing local
machine state, memories, sessions, secrets, broker state, or private project
helpers.

## Contents

| Area | What It Contains |
|---|---|
| `docs/` | Practical guidance for skills, MCPs, plugin development, runtime boundaries, safe commands, and environment patterns. |
| `catalog/` | Public-safe inventories of skills, MCPs, plugin marketplaces, prompts, commands, examples, and coverage checks. |
| `templates/` | Safe starter material for creating new public skills. |
| `examples/` | Small public examples that can be copied or adapted after review. |
| `AGENTS.md` | Repo-local operating rules for keeping this guide public-safe and current. |
| `AGENT-USAGE.md` | Runtime-neutral instructions for Codex, Claude, Gemini, OpenCode, and other agents reading this repo. |

## Skills Covered

The skill catalog includes:

- Codex system skills such as image generation, OpenAI docs, plugin creation,
  skill creation, and skill installation.
- Codex workflow skills for review, debugging, planning, document work, browser
  automation, screenshots, security guidance, vetting, and verification.
- Agents design skills for frontend design, layout, animation, typography,
  critique, polish, responsive adaptation, performance, and UX writing.
- Superpowers workflow skills for brainstorming, planning, TDD, systematic
  debugging, code review, worktrees, verification, and subagent workflows.
- Snapshot-only references for OpenCode/GitNexus and Claude plugin marketplace
  skills.

Main file: [`catalog/skills.md`](catalog/skills.md).

## MCPs Covered

The MCP catalog documents public-safe usage patterns for:

- `serena`: semantic code navigation and project-aware editing support.
- `github`: repository, issue, pull request, code search, and file operations.
- `playwright`: browser automation, screenshots, snapshots, forms, and console
  debugging.
- `filesystem`: scoped local file access through explicit allowlists.
- `brave-search`: optional gated web search provider.
- `megamemory`: per-repo memory database pattern, documented as private-state
  reference only.

Main files:

- [`catalog/mcps.md`](catalog/mcps.md)
- [`docs/mcp-usage-patterns.md`](docs/mcp-usage-patterns.md)

## Plugin And Marketplace Patterns

The local-runtime-profile snapshot contained a large Claude/plugin marketplace
corpus. This repo absorbs the public-safe parts as catalogs and patterns:

- plugin directory structure and `.claude-plugin/plugin.json`
- commands, agents, skills, hooks, scripts, and `.mcp.json`
- MCP integration inside plugins
- hook safety and publishing rules
- Codex companion plugin command patterns
- PR review, feature development, LSP, playground, and plugin-dev references

Main files:

- [`catalog/plugin-marketplaces.md`](catalog/plugin-marketplaces.md)
- [`catalog/prompts-and-commands.md`](catalog/prompts-and-commands.md)
- [`docs/plugin-development-patterns.md`](docs/plugin-development-patterns.md)

## Runtime Profile Absorption

The public local-runtime-profile snapshot had hundreds of Markdown files. They
were not copied wholesale. They were grouped, reviewed, and represented as
public-safe catalogs and reusable patterns.

Current absorbed groups:

| Group | Treatment |
|---|---|
| Codex skills and prompts | Cataloged and summarized. |
| Agents design skills | Cataloged. |
| Superpowers skills, plans, specs, and commands | Cataloged and summarized as workflow patterns. |
| Claude plugin marketplace material | Cataloged and summarized as plugin patterns. |
| OpenCode/GitNexus skills | Cataloged as reference-only. |
| Root profile guidance and exclusions | Summarized as runtime boundary rules. |

Main file: [`docs/local-runtime-profile-absorption.md`](docs/local-runtime-profile-absorption.md).

## Standards And Patterns

The guide captures reusable operating standards:

- use skills only when the task matches their trigger
- prefer narrow skills over broad bundles
- keep repo-local overrides only when they change behavior
- verify before claiming completion
- use raw command output for operational decisions unless a summarizer is
  explicitly requested
- do not use `distill` automatically
- keep MCP allowlists narrow
- treat browser automation and filesystem writes as sensitive capabilities
- promote public-safe patterns, not private runtime artifacts

Main files:

- [`docs/environment-usage-patterns.md`](docs/environment-usage-patterns.md)
- [`docs/runtime-profile-boundaries.md`](docs/runtime-profile-boundaries.md)
- [`docs/windows-powershell-recipes.md`](docs/windows-powershell-recipes.md)

## Safety Model

This repo is intentionally public-safe. It documents how to use and design
skills/MCPs without publishing the user's private runtime.

This repo must not contain:

- tokens, credentials, OAuth state, browser profiles, or raw config files
- runtime memories, session logs, shell history, telemetry, or local databases
- private project helpers, database scripts, company state, or broker state
- machine-specific paths that only work on one workstation
- broad exports of a live runtime profile

Some items are intentionally cataloged but not copied:

- private database helpers
- local memory databases
- raw MCP or Codex config
- third-party plugin source trees that need separate license/safety review
- historical plans/specs that are useful as references but not as active rules

## Recommended Workflow

1. Decide whether the behavior belongs in a skill, a repo rule, or normal docs.
2. Draft the skill with a narrow trigger and a clear output contract.
3. Vet the files for secrets, local paths, and risky commands.
4. Test the skill in a disposable local runtime or a small repo fixture.
5. Promote only the reusable parts.

## Maintenance Workflow

When a new skill, MCP, prompt, command, plugin pattern, or environment rule is
added locally:

1. Decide whether it is public-safe.
2. Add it to the matching catalog.
3. Promote reusable behavior into a guide under `docs/`.
4. Mark private or stateful items as `reference-only` or `excluded-private`.
5. Run formatting and secret/path checks before publishing.

## Update Rule

Keep this repository current whenever reusable skill knowledge changes in a
public repo or in the global Codex/Agents/Superpowers environment. Promote the
public-safe pattern, not the private runtime artifact.

## Start Here

- [Agent usage guide](AGENT-USAGE.md)
- [Skill anatomy](docs/skill-anatomy.md)
- [Installing skills](docs/installing-skills.md)
- [Creating public skills](docs/creating-public-skills.md)
- [Vetting skills](docs/vetting-skills.md)
- [Codex, Agents, and Superpowers](docs/codex-agents-superpowers.md)
- [Environment usage patterns](docs/environment-usage-patterns.md)
- [Runtime profile boundaries](docs/runtime-profile-boundaries.md)
- [MCP usage patterns](docs/mcp-usage-patterns.md)
- [Plugin development patterns](docs/plugin-development-patterns.md)
- [Local runtime profile absorption](docs/local-runtime-profile-absorption.md)
- [Windows PowerShell recipes](docs/windows-powershell-recipes.md)
- [Skill catalog](catalog/skills.md)
- [MCP catalog](catalog/mcps.md)
- [Plugin marketplace catalog](catalog/plugin-marketplaces.md)
- [Prompt and command catalog](catalog/prompts-and-commands.md)
- [Coverage check](catalog/coverage-check.md)

## Limitations

- This is not an installable runtime profile.
- It does not guarantee that a skill or MCP is installed on any machine.
- It does not include secrets, state, private paths, or local databases.
- It catalogs some upstream/plugin material as reference-only instead of
  vendoring the source.
- It favors durable public guidance over exact private-machine reproduction.

## Relationship To DunderIA

`dunderia-public-export` can point here for reusable skill guidance. Runtime
profile snapshots should stay small and sanitized; this repository carries the
long-form guidance instead.
