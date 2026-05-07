# Repository Guidance Patterns

These patterns were extracted from a broad scan of local repositories and agent
workspace files. They are written generically so they can be reused without
publishing private project content.

## Root Instruction File

Keep a small `AGENTS.md` at repo root.

It should define:

- repo purpose
- protected files or topology
- edit boundaries
- validation expectations
- documentation update rules
- commit/push/restart expectations when relevant

Avoid putting long project memory or private context in the root instruction
file.

## Agent Workspace Folder

For larger repos, use a folder such as `docs/agent-workspace/` for agent
bootstrap material.

Useful files:

| File | Purpose |
|---|---|
| `README.md` | Explains what belongs in the agent workspace. |
| `PROJECT.md` | Current project shape and repo-specific context. |
| `TOOLS.md` | Commands, scripts, logs, and operational shortcuts. |
| `HEARTBEAT.md` | Lightweight recurring check instructions. |
| `IDENTITY.md`, `SOUL.md`, `USER.md` | Optional persona/context files when a runtime expects them. |

Public repos should avoid personal memory, customer data, secrets, and raw local
machine paths in these files.

## Agent Harness

When one workspace contains many repos, maintain a small harness that tells an
agent how to operate each repo.

A good harness entry includes:

- where to start reading
- setup command
- validation command
- logs or observable runtime signals
- known blockers
- escalation points
- what not to run without explicit approval

Harness files should point to real commands, but public examples should use
placeholders instead of machine-specific paths.

## OpenSpec Workflow

OpenSpec-style folders are useful when change history should outlive a chat.

Reusable pattern:

```text
openspec/
  README.md
  changes/
    <change-name>/
      proposal.md
      design.md
      tasks.md
      specs/
  specs/
```

Recommended behavior:

- create a named change before broad implementation
- keep proposal, design, tasks, and specs separate
- verify implementation against artifacts
- archive completed changes into durable specs
- do not treat draft artifacts as completed requirements

## Review Loop

A robust review loop has phases:

1. resolve review scope
2. run adversarial review
3. parse findings into a structured schema
4. ask for human approval before broad fixes
5. fix one finding at a time
6. verify after each fix
7. re-review until no material findings remain or a stop condition is reached

This pattern is more reusable than any one review script.

## Frontend Rule Packs

Rule-pack skills can be useful for frontend work when they are kept as
reference-only guidance:

- composition patterns
- React/Next.js performance rules
- web interface guidelines
- project-local component conventions

Before promoting a rule pack, check license, source, and whether it contains
private framework assumptions.

## Project-Local Skills

Project-local skills are appropriate when they encode behavior that is true only
inside one repo.

Examples:

- a renderer-specific UI component guide
- a repo-specific documentation maintenance workflow
- a plan-to-task workflow tied to a product backlog

Public treatment:

- catalog the pattern
- do not copy private implementation details
- extract a generic template only after review

## Agent-Forward Repository Starter

For a new repository that should be operated by humans and agents, use a small
set of root documents instead of storing project truth only in chat history.

Recommended starter:

- `AGENTS.md`, for active agent rules
- `PRODUCT.md`, for current user-visible truth
- `ROADMAP.md`, for direction and non-priorities
- `ARCHITECTURE.md`, for technical map and integration boundaries
- `DESIGN.md`, for UI language and visual QA rules
- `CODESTYLE.md`, for coding and testing conventions
- `PLANS.md`, for executable plan format

Use [`../templates/repository-guidance/`](../templates/repository-guidance/) as
portable starter material.

Security rule: never copy external runtime configs wholesale. Reject or rewrite
configs that disable approvals, grant broad filesystem access, require secrets,
or change sandbox/network policy without explicit local approval.

More detail:
[`agent-forward-repository-template.md`](agent-forward-repository-template.md).
