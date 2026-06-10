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
- When a runtime has an explicit skill-discovery workflow, invoke applicable
  skills before acting instead of treating the catalog as passive reference.
- Prefer process skills first when they change how work should be approached,
  then use implementation skills.
- Skip ceremony for trivial tasks.
- Prefer narrow, task-specific skills over broad bundles.
- Before publishing or installing an external skill, run a vetting pass.
- Keep repo-local skill overrides only when they truly change behavior.

## Goal-Oriented Execution

- Prefer explicit goals over open-ended agent sessions when the work spans
  multiple phases, handoffs, or validation gates.
- Keep goal criteria testable and bounded before implementation starts.
- Use small context packets at workflow transitions instead of loading broad
  project state by default.
- Treat review and codification as distinct phases when the work is important
  enough to preserve durable lessons.
- See `docs/goal-oriented-agent-workflows.md` for the full public-safe pattern.

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

## TectrilhaSkills Environment Preview

Use the preview script when an agent needs to check whether the local
Codex/Agents/Superpowers environment and this public guide still line up:

```powershell
.\scripts\tectrilha-env-sync-preview.ps1
```

For automation or follow-up reporting:

```powershell
.\scripts\tectrilha-env-sync-preview.ps1 -Json
```

The script is read-only. It checks guide files, local instruction references,
trusted workspace visibility, local checkouts, installed skill names, catalog
coverage, and unsafe strings in templates. It never installs skills, rewrites
runtime config, copies private state, or applies changes automatically.

Apply any recommended change manually after review and user approval.
