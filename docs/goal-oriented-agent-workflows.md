# Goal-Oriented Agent Workflows

This guide describes a public-safe workflow pattern for coding agents that work
against explicit goals instead of open-ended sessions.

It absorbs useful ideas from tools such as
[`jumbocontext/jumbo.cli`](https://github.com/jumbocontext/jumbo.cli) without
requiring their runtime, hooks, local state model, or event store.

## When To Use This Pattern

Use a goal-oriented workflow when:

- work spans more than one agent turn or session
- acceptance criteria matter more than raw speed
- handoff between design, implementation, review, and cleanup needs to stay
  explicit
- multiple agents or terminals may work in parallel
- important decisions, invariants, or lessons should survive the current task

Do not force this workflow onto trivial one-shot tasks. Use it when structure
reduces ambiguity or rework.

## Core Idea

The key move is simple: define a goal before implementation starts, then move
that goal through explicit phases with evidence at each transition.

A good goal usually includes:

- objective
- success criteria
- scope in
- scope out
- relevant constraints
- related decisions, invariants, or standards

This keeps the workflow attached to outcomes instead of vague momentum.

## Recommended Phases

These phases are reusable across Codex, Claude, Gemini, Copilot, and similar
agent setups.

### 1. Refine

Clarify the goal before touching code.

Refinement should:

- tighten the objective
- make success criteria testable
- identify boundaries and non-goals
- gather only the context that is actually relevant
- attach known decisions, guidelines, and invariants

The output of refinement is a small, implementation-ready context packet.

### 2. Implement

Execute the goal against the refined scope.

Implementation should:

- stay inside the declared boundaries
- update progress in terms of the goal, not just file edits
- avoid broad speculative refactors unless the goal requires them
- keep validation close to the change

### 3. Review

Review is a distinct phase, not an afterthought.

Review should answer:

- did the implementation satisfy the stated criteria?
- did it violate any known invariant or standard?
- is the evidence strong enough to claim success?
- does the goal need another implementation pass?

If review fails, route the goal back to implementation instead of silently
accepting partial work.

### 4. Codify

After a goal succeeds, capture what should outlive the session.

Codification may include:

- documentation updates
- changelog entries
- recorded decisions and rationale
- newly discovered invariants
- reusable patterns worth promoting into repo guidance or skills

Codify only durable signal. Do not dump raw session history into permanent
guidance.

## Context Packets

One of the most useful ideas in goal-oriented systems is the context packet:
a bounded bundle of only the information needed for the next phase.

Typical contents:

- goal objective and criteria
- boundaries and exclusions
- relevant components and dependencies
- applicable guidelines and invariants
- related decisions and prior findings

The point is not to store everything forever. The point is to reduce token
waste and context drift by loading the right context at the right transition.

## Handoff Rules

Handoffs are where agent workflows often break down. Make them explicit.

A good handoff includes:

- current goal and phase
- what is complete
- what remains
- evidence already gathered
- open risks or failed checks
- exact next action expected from the next agent or session

Avoid handoffs that only say "continue from here" or "finish the rest."

## Parallel Work Guardrails

Parallel agents can help, but only under low-conflict conditions.

Use parallel execution when:

- scopes do not overlap
- each worker owns a separate goal
- each goal is small enough to review independently
- progress can be paused or resumed without hidden state

Guardrails:

- assign non-overlapping scopes
- keep goals vertically sliced
- submit work for review frequently
- avoid shared mutable checklists with ambiguous ownership

Parallelism is useful only when coordination cost stays lower than the speed
gain.

## What To Preserve

The most reusable part of this pattern is not the tooling. It is the discipline
around preserving the right kinds of knowledge.

Durable items worth preserving:

- decisions and rationale
- invariants
- coding standards clarified by user correction
- reusable workflow rules
- stable architecture or dependency constraints

Items that usually should not be preserved as permanent guidance:

- raw session logs
- transient prompts
- local task claims
- ephemeral runtime state
- private machine paths

## Boundaries

This repository promotes the workflow pattern, not any one runtime.

By default, do not treat the following as part of the reusable public pattern:

- a required `.jumbo/` or equivalent local memory directory
- mandatory hooks into every agent session
- local event stores or SQLite projections
- automatic mutation of `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, or editor files
- hidden background daemons as a baseline workflow assumption

Those may be valid implementation choices in a private runtime, but they are
not required to reuse the underlying workflow discipline.

## How This Fits TectrilhaSkills

Within this repository, the pattern connects to existing public guidance:

- use `catalog/prompts-and-commands.md` to document phase-oriented command
  patterns
- use `docs/environment-usage-patterns.md` for general behavioral rules
- use `catalog/skills.md` when a phase is better represented as a skill trigger
- promote only public-safe, reusable behavior

## Reference-Only Source

`jumbo.cli` is a useful `reference-only` source for:

- explicit goal lifecycles
- refine/implement/review/codify phase boundaries
- bounded context packets
- safe parallel goal execution
- codification of durable lessons after implementation

It should not be copied wholesale into a public guide as a second runtime,
memory store, or hook model.
