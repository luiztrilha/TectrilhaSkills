# Environment Scan

Last checked: 2026-06-06.

This scan looked for Markdown files, skills, descriptions, orientation files,
and reusable operating patterns across the local agent environment and
workspace repositories.

The scan intentionally avoided copying private project content. Findings are
represented as catalogs and reusable patterns.

## Scope

Checked categories:

- workspace-level instruction files
- repo-local `AGENTS.md` and related runtime instruction files
- `docs/agent-workspace/` folders
- workspace-level `docs/agent-harness/` material
- OpenSpec folders and change artifacts
- `.agents/skills`, `.codex/skills`, and `.claude/skills`
- DunderIA starter-kit skills
- public export/runtime profile material already represented elsewhere
- external agent-forward repository templates reviewed read-only

Ignored or excluded:

- session logs
- memories
- raw runtime config
- sqlite databases
- authentication files
- browser profiles
- private database helper source
- generated dependency/build folders

## High-Value Findings

| Finding | Treatment | Added To |
|---|---|---|
| OpenSpec artifact-driven workflow skills | cataloged as reference-only workflow family | [`skills.md`](skills.md) |
| Codex review loop skill | cataloged as reference-only review pattern | [`skills.md`](skills.md), [`../docs/repository-guidance-patterns.md`](../docs/repository-guidance-patterns.md) |
| React/Vercel composition and performance rule packs | cataloged as reference-only design/performance rules | [`skills.md`](skills.md) |
| repo agent workspace folders | summarized as a reusable repo bootstrap pattern | [`../docs/repository-guidance-patterns.md`](../docs/repository-guidance-patterns.md) |
| workspace agent harness | summarized as a reusable operational harness pattern | [`../docs/repository-guidance-patterns.md`](../docs/repository-guidance-patterns.md) |
| contribution report skill | cataloged as reusable maintainer-report pattern | [`skills.md`](skills.md) |
| documentation maintenance and plan-to-task skills | cataloged as project-specific references | [`skills.md`](skills.md) |
| project-local UI development skill | cataloged as project-specific UI convention pattern | [`skills.md`](skills.md) |
| `xklob/codex-repo-template` | absorbed selectively as repo starter guidance; unsafe runtime config rejected | [`repository-templates.md`](repository-templates.md), [`../docs/agent-forward-repository-template.md`](../docs/agent-forward-repository-template.md) |

## Useful Patterns To Preserve

- Keep `AGENTS.md` discoverable at repo root.
- Move bulky or local agent context into `docs/agent-workspace/`.
- Use a small repo harness when agents need setup, validation, logs, and
  escalation paths across many repos.
- Treat OpenSpec artifacts as durable change memory: proposals, designs, specs,
  tasks, handoffs, and archives.
- Keep project-local skills only when they encode real local behavior.
- Promote reusable skill ideas to public guidance, but leave private project
  procedures out.
- Catalog rule packs as reference-only unless licensing and safety are reviewed.
- Treat external repo templates as inspiration; copy only public-safe document
  patterns after vetting configs, scripts and skill permissions.

## Candidate Backlog

Future public-safe improvements:

- Add a sanitized OpenSpec workflow guide.
- Add a generic agent harness template.
- Add a generic agent workspace folder template.
- Add a public skill template for maintainer-grade contribution reports.
- Add a public UI project conventions template inspired by project-local UI
  skills.
