# Skill Inventory

Last checked: 2026-05-06.

This inventory reflects the public-safe view of the local Codex, Agents, and
Superpowers skill environment. It catalogs all known skills and marks whether
the source should be copied as a public example or kept as private/local-only.

## Status Legend

- `cataloged`: documented here as part of the public skill map
- `public-example`: source example is included under `examples/`
- `reference-only`: document the concept, but do not copy runtime files blindly
- `excluded-private`: intentionally not promoted because it is project-specific
  or can reveal private operational details
- `container`: directory groups skills, but is not itself a skill

## Codex System Skills

| Skill | Status | Public Guidance |
|---|---|---|
| `imagegen` | `reference-only` | Generate or edit bitmap visuals when the task needs AI-created raster assets. |
| `openai-docs` | `reference-only` | Use official OpenAI documentation for OpenAI product/API guidance. |
| `plugin-creator` | `reference-only` | Scaffold local Codex plugins and plugin metadata. |
| `skill-creator` | `reference-only` | Design or update skills with clear trigger rules and workflows. |
| `skill-installer` | `reference-only` | Install curated or repository-hosted skills into a local Codex runtime. |

## Codex Workflow Skills

| Skill | Status | Public Guidance |
|---|---|---|
| `caveman` | `public-example` | Compact communication mode for token-efficient replies. |
| `code-review-findings` | `cataloged` | Use for code review reports that prioritize bugs, regressions, risks, and missing tests. |
| `doc` | `cataloged` | Use for `.docx` work where layout, fields, styles, or comments matter. |
| `grill-me` | `cataloged` | Stress-test plans by asking targeted questions until the decision tree is clear. |
| `implementation-planning-lite` | `cataloged` | Create a concise implementation plan for larger or ambiguous coding tasks. |
| `pdf` | `cataloged` | Use for PDF reading, creation, rendering, or layout-sensitive review. |
| `playwright` | `cataloged` | Automate a real browser from terminal-based Playwright flows. |
| `playwright-interactive` | `cataloged` | Use persistent browser or Electron interaction for iterative UI debugging. |
| `pptx` | `cataloged` | Use for PowerPoint decks where layouts, placeholders, notes, or charts matter. |
| `screenshot` | `cataloged` | Capture desktop or system screenshots when browser-level capture is not enough. |
| `security-best-practices` | `cataloged` | Review language/framework security practices for supported stacks. |
| `self-improvement-lite` | `cataloged` | Decide whether durable learnings belong in canonical local files. |
| `skill-vetter` | `cataloged` | Vet external skills before installation or publication. |
| `sql-convenios` | `excluded-private` | Private database workflow helper. Do not publish or generalize its source. |
| `systematic-debugging-lite` | `cataloged` | Root-cause debugging workflow for regressions and uncertain failures. |
| `verification-before-close` | `cataloged` | Final evidence check before claiming work is complete. |
| `xlsx` | `cataloged` | Use for Excel, CSV, formulas, formatting, dates, or workbook fidelity. |

## Agents Design Skills

| Skill | Status | Public Guidance |
|---|---|---|
| `adapt` | `cataloged` | Make interfaces work across screen sizes, devices, and contexts. |
| `animate` | `cataloged` | Add purposeful motion and micro-interactions. |
| `audit` | `cataloged` | Run broad UI quality checks across accessibility, performance, theming, and responsiveness. |
| `bolder` | `cataloged` | Increase visual impact while keeping usability intact. |
| `brainstorming` | `cataloged` | Explore intent and requirements before creative or behavior-changing work. |
| `clarify` | `cataloged` | Improve UX copy, labels, instructions, and error messages. |
| `colorize` | `cataloged` | Add strategic color to under-expressive interfaces. |
| `critique` | `cataloged` | Evaluate design quality, hierarchy, information architecture, and cognitive load. |
| `distill` | `cataloged` | Simplify designs only when explicitly requested by the user. |
| `frontend-design` | `cataloged` | Build polished, production-grade frontend interfaces. |
| `impeccable` | `cataloged` | Create distinctive frontend interfaces and design-system-ready components. |
| `layout` | `cataloged` | Improve spacing, alignment, rhythm, and visual hierarchy. |
| `optimize` | `cataloged` | Diagnose and improve UI performance. |
| `overdrive` | `cataloged` | Push interfaces with advanced motion, shaders, or technically ambitious effects. |
| `polish` | `cataloged` | Final detail pass for alignment, consistency, and micro-quality. |
| `quieter` | `cataloged` | Reduce overwhelming visual intensity while preserving quality. |
| `shape` | `cataloged` | Produce a UX/UI design brief before implementation. |
| `superpowers` | `container` | Container for workflow discipline skills. Individual skills are listed below. |
| `typeset` | `cataloged` | Improve typography, hierarchy, readability, and sizing. |
| `ui-ux-pro-max` | `cataloged` | Broad UI/UX planning, review, and implementation guidance across stacks. |

## Superpowers Workflow Skills

| Skill | Status | Public Guidance |
|---|---|---|
| `brainstorming` | `cataloged` | Discovery workflow before creative or behavior-changing work. |
| `dispatching-parallel-agents` | `cataloged` | Split independent tasks across parallel agents. |
| `executing-plans` | `cataloged` | Execute a written implementation plan with checkpoints. |
| `finishing-a-development-branch` | `cataloged` | Decide how to finish, merge, PR, or clean up a branch. |
| `receiving-code-review` | `cataloged` | Evaluate code review feedback rigorously before changing code. |
| `requesting-code-review` | `cataloged` | Ask for review after substantial implementation. |
| `subagent-driven-development` | `cataloged` | Coordinate implementation with independent subagents. |
| `systematic-debugging` | `cataloged` | Investigate bugs by proving cause before fixing. |
| `test-driven-development` | `cataloged` | Write failing tests before implementation when applying TDD. |
| `using-git-worktrees` | `cataloged` | Use isolated worktrees for feature work. |
| `using-superpowers` | `cataloged` | Establish skill discovery and invocation workflow. |
| `verification-before-completion` | `cataloged` | Verify evidence before claiming completion. |
| `writing-plans` | `cataloged` | Produce implementation plans before touching code. |
| `writing-skills` | `cataloged` | Create or edit skills and verify them before deployment. |
