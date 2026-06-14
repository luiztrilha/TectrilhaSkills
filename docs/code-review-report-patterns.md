# Code Review Report Patterns

Public-safe template for a comprehensive codebase review that produces a single
prioritized `.md` report. Reusable as a base prompt for an audit; adapt the
dimensions and priorities to the target stack.

## Goal

Review the whole codebase and produce one prioritized `.md` report. Don't stop
until every area is reviewed and recorded. Use subagents to split independent
areas when the scope is large.

## Review dimensions

- **Correctness & bugs** — logic errors, edge cases, unhandled null/undefined,
  race conditions, off-by-one.
- **Redundancy & dead code** — unused imports, vars, components, routes, helpers,
  feature flags that can be deleted.
- **Refactoring** — DRY violations, oversized components/functions, logic that
  should be extracted, shared, or co-located.
- **Performance** — needless re-renders, N+1 queries, missing DB indexes,
  redundant fetches, over-fetching (`select *`, unused fields), missing caching,
  expensive local work that belongs on the server or memoized, egress reduction.
- **Patterns & conventions** — inconsistent data fetching, error handling,
  loading states, forms, auth checks; flag where a pattern is right in one place
  and ignored in another.
- **Security** — injection, exposed secrets, insecure patterns, improper auth
  checks.
- **Maintainability & readability** — poor separation of concerns, tight
  coupling, missing types, confusing logic, inconsistent naming, missing comments
  on non-obvious decisions.
- **Feature logic** — features make sense, flow well, meet user expectations
  (UI/UX).
- **Over-engineering** — fallbacks, divergent initial vs final data, solutions
  more complex than needed.

**North star:** DRY, clean, as simple as possible / as complex as necessary,
maintainable, performant, fast and responsive UX.

## Report format (single `.md`)

### 1. Executive summary

3–5 sentences on overall health, biggest risks, dominant patterns (good and bad).

### 2. Prioritized action items

Group into P0–P3:

- **P0** — data loss, security breach, or production crash.
- **P1** — likely bug or significant UX/perf degradation under real conditions.
- **P2** — accumulating tech debt; refactors and pattern incoherence.
- **P3** — polish, consistency, small DX improvements.

Each item: **title**, **affected files/functions** (specific), **problem** (what
and why it matters), **fix prompt** (a self-contained prompt ready to paste into
a fresh chat — relevant files, current behavior, desired behavior, enough context
to act without this report).

### 3. Quick wins

Small, safe, low-effort fixes (dead imports, trivial extractions, rename
consistency) that can be batched into one prompt.

### 4. Redundancy removal log

A flat list of everything deletable — files, functions, imports, feature flags —
with a one-line rationale each.

## Why this shape

A prioritized report with paste-ready fix prompts is more reusable than any one
review script: it survives the chat, routes work by severity, and lets a
follow-up agent act on each item independently.
