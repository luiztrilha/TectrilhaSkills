# Plugin Marketplace Catalog

Last checked: 2026-05-06.

This catalog summarizes plugin marketplace material found in the public
local-runtime-profile snapshot. It is a map, not a wholesale copy.

## Marketplace Groups

| Marketplace | Treatment | Notes |
|---|---|---|
| `claude-plugins-official` | `reference-only` | Official plugin and external-plugin examples. Useful for plugin structure, commands, agents, hooks, skills, and settings patterns. |
| `openai-codex` | `reference-only` | Codex companion plugin material, commands, result handling, rescue flow, review prompts, and runtime integration patterns. |
| `superpowers-marketplace` | `reference-only` | Superpowers packaging and workflow marketplace reference. |

## Official Plugin Families

| Family | Public Use |
|---|---|
| `agent-sdk-dev` | Agent SDK scaffolding and verifier patterns. |
| `claude-code-setup` | Setup automation recommendations. |
| `claude-md-management` | Instruction-file improvement workflows. |
| `code-review` | Review command patterns. |
| `code-simplifier` | Refactoring/simplification agent pattern. |
| `commit-commands` | Commit, push, PR, and branch cleanup command patterns. |
| `feature-dev` | Multi-agent feature development pattern. |
| `frontend-design` | Frontend design plugin packaging. |
| `hookify` | Hook creation, examples, and safety warnings. |
| `math-olympiad` | Domain-specific reasoning plugin example. |
| `mcp-server-dev` | MCP server, MCPB, and app/widget development. |
| `playground` | Template-driven exploration and playground workflows. |
| `plugin-dev` | Plugin structure, commands, agents, hooks, settings, and skills. |
| `pr-review-toolkit` | Specialized PR review agents. |
| `ralph-loop` | Iterative loop command pattern. |
| `skill-creator` | Skill creation workflow. |
| language LSP plugins | LSP plugin packaging examples for C#, clangd, Go, Java, Kotlin, Lua, PHP, Pyright, Ruby, Rust, Swift, and TypeScript. |

## External Plugin Families

| Family | Public Use |
|---|---|
| `discord` | External messaging access/configuration pattern. |
| `fakechat` | Chat integration example. |
| `greptile` | External code intelligence integration example. |
| `imessage` | Local messaging access/configuration pattern. |
| `telegram` | Messaging access/configuration pattern. |

## Patterns Absorbed

- plugin manifest lives in `.claude-plugin/plugin.json`
- component directories belong at plugin root: `commands/`, `agents/`, `skills/`, `hooks/`, scripts, and optional `.mcp.json`
- component paths should be relative and portable
- plugin examples should avoid real credentials and machine-specific paths
- MCP integration belongs in a dedicated `.mcp.json` when it grows beyond a simple single-server case
- hook examples need strong safety language because they can block or mutate workflows
- commands should have clear names, arguments, and output contracts

## Not Absorbed Wholesale

- third-party plugin source trees
- external service access instructions containing provider-specific private setup
- local hook examples meant for a private machine
- raw marketplace snapshots
