# Environment Usage Patterns

These are public-safe patterns extracted from the local operating environment.
They are guidance, not a copy of private runtime files.

## Rule Precedence

Use this order when instructions overlap:

1. explicit user instruction
2. repo-local `AGENTS.md`
3. workspace or runtime policy
4. task-specific docs
5. reusable skill guidance

## Skill Use

- Use a skill when the task naturally matches its trigger.
- Skip ceremony for trivial tasks.
- Prefer narrow, task-specific skills over broad bundles.
- Before publishing or installing an external skill, run a vetting pass.
- Keep repo-local skill overrides only when they truly change behavior.

## Evidence Before Closure

Before claiming a task is complete:

- re-read the requested outcome
- confirm touched files and commands
- run the smallest meaningful validation
- separate verified facts from unverified assumptions
- report anything skipped or blocked

## Command Output

Prefer raw command output for operational decisions. Summarizers and reducers
can help with noisy output only when explicitly requested or when the raw
evidence is still checked before acting.

## Distill Policy

Do not use `distill` automatically. Use it only when the user explicitly asks
for it, and keep the prompt contract precise.

## Safe Command Style On Windows

- Prefer direct executables such as `git`, `rg`, `dotnet`, `go`, `npm`, and `node`.
- When PowerShell is needed, prefer named scripts with `pwsh -NoProfile`.
- Avoid large one-liners, `Invoke-Expression`, encoded commands, download-and-run
  flows, and temporary script loaders.
- Prefer scripts stored under a repo `scripts/` directory.

## Public Skills Guide Sync

Keep this guide current whenever reusable skill knowledge changes in a public
repo or in the global Codex/Agents/Superpowers environment. Promote the
public-safe pattern, not the private runtime artifact.
