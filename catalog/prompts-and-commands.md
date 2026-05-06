# Prompt And Command Catalog

Last checked: 2026-05-06.

This catalog summarizes prompt, command, and agent-orientation material found in
the public local-runtime-profile snapshot.

## Codex Prompts

| Prompt | Treatment | Public Use |
|---|---|---|
| `opsx-propose` | `reference-only` | OpenSpec proposal prompt pattern. |
| `opsx-explore` | `reference-only` | OpenSpec exploration prompt pattern. |
| `opsx-apply` | `reference-only` | OpenSpec implementation prompt pattern. |
| `opsx-archive` | `reference-only` | OpenSpec archival prompt pattern. |

## Superpowers Commands

| Command | Treatment | Public Use |
|---|---|---|
| `brainstorm` | `reference-only` | Discovery command pattern before creative or behavior-changing work. |
| `write-plan` | `reference-only` | Plan-writing command pattern. |
| `execute-plan` | `reference-only` | Plan-execution command pattern. |

## Claude Command Wrappers

| Command | Treatment | Public Use |
|---|---|---|
| `doc` | `cataloged` | Route document work to the matching skill. |
| `grill-me` | `cataloged` | Route plan stress-testing to the matching skill. |
| `pdf` | `cataloged` | Route PDF work to the matching skill. |
| `playwright` | `cataloged` | Route browser automation to the matching skill. |
| `playwright-interactive` | `cataloged` | Route persistent browser debugging to the matching skill. |
| `screenshot` | `cataloged` | Route system screenshot work to the matching skill. |
| `security-best-practices` | `cataloged` | Route security guidance to the matching skill. |
| `skill-vetter` | `cataloged` | Route skill vetting to the matching skill. |

## Codex Companion Plugin Commands

| Command | Treatment | Public Use |
|---|---|---|
| `setup` | `reference-only` | Initialize companion runtime integration. |
| `status` | `reference-only` | Inspect runtime status. |
| `review` | `reference-only` | Run review-oriented companion flow. |
| `adversarial-review` | `reference-only` | Run stricter review prompt flow. |
| `result` | `reference-only` | Retrieve companion output. |
| `rescue` | `reference-only` | Forward a task to Codex for recovery. |
| `cancel` | `reference-only` | Cancel companion work. |

## Agent Patterns

| Agent Pattern | Treatment | Public Use |
|---|---|---|
| code reviewer | `cataloged` | Independent review with findings-first output. |
| code explorer | `cataloged` | Read-only codebase discovery. |
| code architect | `cataloged` | Design and implementation-shaping advice. |
| code simplifier | `cataloged` | Complexity reduction and refactoring suggestions. |
| plugin validator | `cataloged` | Plugin quality and structure validation. |
| skill reviewer | `cataloged` | Skill quality and safety review. |

## Absorption Rule

Prompts and commands are cataloged by behavior. Do not publish private prompt
variants that contain local paths, internal repo names, tokens, credentials, or
session-specific context.
