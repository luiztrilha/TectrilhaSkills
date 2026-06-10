# Jumbo CLI Absorption Design

Date: 2026-06-10
Status: Draft for review
Scope: `TectrilhaSkills`

## Goal

Absorb the reusable public-safe workflow ideas from `jumbocontext/jumbo.cli`
into `TectrilhaSkills` without adopting Jumbo as a required runtime, memory
store, hook layer, or operational dependency.

## Why This Fits TectrilhaSkills

`TectrilhaSkills` is a handbook for reusable agent capabilities and workflow
patterns. The useful part of Jumbo is not its local `.jumbo/` store or CLI
surface. The useful part is its discipline around goal-oriented execution,
handoff, review, and codification of learning.

That matches this repository's purpose and should be represented as guidance,
not as installation instructions for a second agent runtime.

## What Will Be Absorbed

The guide will promote these patterns as reusable workflow ideas:

1. Explicit goal-oriented execution instead of open-ended agent sessions.
2. Deliberate phase transitions such as refine, implement, review, and codify.
3. Clear handoff boundaries between phases or agents.
4. Parallel execution only for independent scopes with non-overlapping changes.
5. Durable capture of decisions, invariants, and lessons after meaningful work.

## What Will Not Be Absorbed

The guide will explicitly reject these as defaults for the public pattern:

1. Installing `jumbo.cli` as a required dependency.
2. Copying `.jumbo/`, event stores, state snapshots, or local task history.
3. Adopting Jumbo hooks as an always-on layer in Codex or other runtimes.
4. Replacing repo-local `AGENTS.md`, skills, or existing validation workflows.
5. Presenting Jumbo as the source of truth over live runtime instructions.

## Planned Repository Changes

### New guide

Add a new document under `docs/` describing a public-safe
goal-oriented workflow for coding agents, using Jumbo as a
`reference-only` source.

The guide should cover:

- when to use the workflow
- the phases and their purpose
- handoff rules
- parallelization guardrails
- codification of lessons
- boundaries against secondary runtime state and hidden automation

### Catalog updates

Update a catalog entry to record Jumbo as a `reference-only` workflow source and
to summarize which behaviors were absorbed.

Most likely targets:

- `catalog/prompts-and-commands.md` for phase-oriented command patterns
- `catalog/skills.md` if the pattern is framed as a workflow family reference

### README update

Update `README.md` so the new workflow guidance is discoverable from the main
navigation.

## Recommended File Set

The implementation should likely touch only:

- `README.md`
- `docs/goal-oriented-agent-workflows.md` or equivalent name
- `catalog/prompts-and-commands.md`

Optionally:

- `docs/environment-usage-patterns.md` if a short cross-reference improves
  discoverability without duplicating guidance

## Writing Constraints

1. Keep the language portable and public-safe.
2. Avoid machine-specific paths and private runtime assumptions.
3. Describe Jumbo as a reference, not as a mandatory tool.
4. Separate absorbed patterns from rejected runtime mechanisms.
5. Keep the result useful to Codex, Claude, Gemini, and similar agent setups.

## Validation Plan

Validation should remain lightweight and concrete:

1. Confirm the new guide is linked from `README.md`.
2. Confirm the chosen catalog mentions Jumbo as `reference-only`.
3. Re-read for public-safety: no private paths, runtime state, or local hooks.
4. Verify the new text does not imply automatic installation or adoption.

## Non-Goals

This change does not:

- install Jumbo
- benchmark Jumbo
- compare every CLI feature in depth
- recreate Jumbo command syntax verbatim
- change the active local Codex runtime

## Recommendation

Implement the absorption as a documentation pattern, not as a runtime
integration. This preserves the value of Jumbo's workflow discipline while
avoiding duplicate memory systems, hooks, or hidden operational state.
