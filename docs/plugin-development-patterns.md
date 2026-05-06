# Plugin Development Patterns

These patterns were distilled from the local-runtime-profile plugin material.
They are public-safe guidance, not a copy of a private runtime.

## Directory Shape

Use a predictable plugin layout:

```text
plugin-name/
  .claude-plugin/
    plugin.json
  commands/
  agents/
  skills/
  hooks/
  scripts/
  .mcp.json
```

Only create directories the plugin actually uses.

## Manifest

Keep the required manifest under `.claude-plugin/plugin.json`.

Use:

- kebab-case plugin names
- semantic versions
- clear descriptions
- relative component paths
- portable placeholders instead of machine paths

## Components

| Component | Guidance |
|---|---|
| `commands/` | Markdown command files with clear usage and output contract. |
| `agents/` | Focused subagents with narrow responsibilities. |
| `skills/` | Skill folders with `SKILL.md` and optional references/scripts. |
| `hooks/` | Safety-sensitive event handlers; keep explicit and auditable. |
| `.mcp.json` | Dedicated MCP configuration when a plugin exposes tools. |
| `scripts/` | Small helpers used by commands, hooks, or skills. |

## MCP In Plugins

Prefer a dedicated `.mcp.json` for non-trivial MCP integration. Keep secrets in
environment variables or the host runtime, not in plugin files.

Document:

- server purpose
- required credentials by name, not value
- expected permissions
- tool approval posture
- failure behavior

## Commands

Good commands:

- have one clear job
- name required arguments
- state side effects
- define output shape
- avoid embedding private repo assumptions

## Hooks

Hooks can block, warn, or mutate workflows. Treat them as high-risk automation:

- make them narrow
- log enough for debugging
- avoid hidden network calls
- avoid broad destructive commands
- provide escape or override guidance where appropriate

## Publishing Checklist

Before publishing plugin material:

1. remove private paths and credentials
2. remove local runtime state and cache files
3. replace real service names with placeholders when needed
4. inspect scripts and hooks manually
5. verify markdown links and examples
6. document what is reference-only
