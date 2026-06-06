# Skill Inventory

Last checked: 2026-06-06.

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
| `openai-docs` | `reference-only` | Use OpenAI developer docs first for product/API guidance, model selection, upgrades, and citations; fall back only to official OpenAI domains. |
| `plugin-creator` | `reference-only` | Scaffold local Codex plugins and plugin metadata. |
| `skill-creator` | `reference-only` | Design or update skills with clear trigger rules and workflows. |
| `skill-installer` | `reference-only` | Install curated, experimental, or repository-hosted skills into a local Codex runtime and restart after install. |

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
| `skill-vetter` | `cataloged` | Vet external skills for source quality, red flags, permission scope, and install risk before trusting them. |
| `sql-convenios` | `excluded-private` | Private database workflow helper. Do not publish or generalize its source. |
| `systematic-debugging-lite` | `cataloged` | Root-cause debugging workflow for regressions and uncertain failures. |
| `verification-before-close` | `cataloged` | Final evidence check that separates verified results, skipped validation, and blocked checks before closure. |
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
| `using-superpowers` | `cataloged` | Establish skill discovery discipline, process-skill ordering, and mandatory skill invocation before action. |
| `verification-before-completion` | `cataloged` | Verify evidence before claiming completion. |
| `writing-plans` | `cataloged` | Produce implementation plans before touching code. |
| `writing-skills` | `cataloged` | Create or edit skills and verify them before deployment. |

## Snapshot-Only OpenCode Skills

These were present in the public local-runtime-profile snapshot. They are
cataloged as concepts, not active Codex skills.

| Skill | Status | Public Guidance |
|---|---|---|
| `gitnexus-cli` | `reference-only` | CLI operations for indexed knowledge graph workflows. |
| `gitnexus-debugging` | `reference-only` | Use knowledge graph context to trace bug causes. |
| `gitnexus-exploring` | `reference-only` | Explore architecture and code relationships. |
| `gitnexus-guide` | `reference-only` | Reference for GitNexus tools, resources, and graph schema. |
| `gitnexus-impact-analysis` | `reference-only` | Analyze blast radius and change impact. |
| `gitnexus-refactoring` | `reference-only` | Coordinate refactors using graph-backed context. |

## Snapshot-Only Claude Plugin Skills

These were present in the public local-runtime-profile snapshot through Claude
plugin marketplaces. They are useful references for skill and plugin design.

| Plugin | Skill | Status | Public Guidance |
|---|---|---|---|
| `claude-code-setup` | `claude-automation-recommender` | `reference-only` | Recommend automation components for a Claude setup. |
| `claude-md-management` | `claude-md-improver` | `reference-only` | Improve agent instruction files. |
| `example-plugin` | `example-command` | `reference-only` | Minimal command example. |
| `example-plugin` | `example-skill` | `reference-only` | Minimal skill example. |
| `frontend-design` | `frontend-design` | `reference-only` | Frontend design skill packaging reference. |
| `hookify` | `writing-rules` | `reference-only` | Hook/rule authoring patterns. |
| `math-olympiad` | `math-olympiad` | `reference-only` | Domain-specific reasoning skill reference. |
| `mcp-server-dev` | `build-mcp-app` | `reference-only` | MCP app/widget development reference. |
| `mcp-server-dev` | `build-mcp-server` | `reference-only` | MCP server development reference. |
| `mcp-server-dev` | `build-mcpb` | `reference-only` | MCPB packaging reference. |
| `playground` | `playground` | `reference-only` | Playground/template workflow reference. |
| `plugin-dev` | `agent-development` | `reference-only` | Agent component development pattern. |
| `plugin-dev` | `command-development` | `reference-only` | Command component development pattern. |
| `plugin-dev` | `hook-development` | `reference-only` | Hook component development pattern. |
| `plugin-dev` | `mcp-integration` | `reference-only` | MCP integration in plugins. |
| `plugin-dev` | `plugin-settings` | `reference-only` | Plugin settings pattern. |
| `plugin-dev` | `plugin-structure` | `reference-only` | Plugin manifest and directory structure. |
| `plugin-dev` | `skill-development` | `reference-only` | Skill component development pattern. |
| `session-report` | `session-report` | `reference-only` | Session reporting pattern. |
| `skill-creator` | `skill-creator` | `reference-only` | Skill creation workflow. |
| `discord` | `access` | `external-reference` | External service access pattern. |
| `discord` | `configure` | `external-reference` | External service configuration pattern. |
| `imessage` | `access` | `external-reference` | External service access pattern. |
| `imessage` | `configure` | `external-reference` | External service configuration pattern. |
| `telegram` | `access` | `external-reference` | External service access pattern. |
| `telegram` | `configure` | `external-reference` | External service configuration pattern. |
| `codex` | `codex-cli-runtime` | `reference-only` | Codex companion runtime routing reference. |
| `codex` | `codex-result-handling` | `reference-only` | Codex result handling reference. |
| `codex` | `gpt-5-4-prompting` | `reference-only` | Prompting guidance reference for Codex runs. |

## Environment Scan Skill Candidates

These skills were discovered outside the active global skill folders during a
broader scan of repo-local and starter-kit material. They are cataloged here
because their patterns are reusable.

| Skill | Status | Public Guidance |
|---|---|---|
| `codex-review-loop` | `reference-only` | Adversarial Codex review flow with structured findings, human approval, atomic fixes, and re-review. |
| `openai-docs` | `cataloged` | Official-docs-first workflow for OpenAI product and API questions. |
| `project-conventions` | `reference-only` | Repo convention bundle pattern for typing, structure, testing, and review expectations. |
| `vercel-composition-patterns` | `reference-only` | React composition rules for scalable component APIs and state boundaries. |
| `vercel-react-best-practices` | `reference-only` | React/Next.js performance rule pack covering waterfalls, bundle size, server/client data, re-rendering, rendering, and JS performance. |
| `web-design-guidelines` | `reference-only` | UI review checklist pattern for web interface compliance. |
| `contribution-report` | `cataloged` | Maintainer-grade report pattern for PRs, branches, patches, or external system comparisons. |
| `dunderia-doc-maintenance` | `project-specific-reference` | Documentation maintenance skill pattern for syncing public docs/manuals with product changes. |
| `dunderia-plan-to-tasks` | `project-specific-reference` | Plan-to-task conversion pattern for turning strategy into executable agent lanes. |
| `ui-dev` | `project-specific-reference` | Project-local UI development guide pattern for component APIs, modals, CSS variables, and renderer conventions. |

## OpenSpec Workflow Skill Family

The scan found a complete OpenSpec skill family. It is useful as a public
artifact-driven change workflow reference.

| Skill | Status | Public Guidance |
|---|---|---|
| `openspec-new-change` | `reference-only` | Start a structured change and stop after showing the first artifact template. |
| `openspec-explore` | `reference-only` | Explore and shape an idea before writing change artifacts. |
| `openspec-continue-change` | `reference-only` | Continue an existing change by creating the next ready artifact. |
| `openspec-apply-change` | `reference-only` | Implement tasks from accepted change artifacts. |
| `openspec-verify-change` | `reference-only` | Verify implementation against artifacts and requirements. |
| `openspec-archive-change` | `reference-only` | Archive a completed change into durable specs. |
| `openspec-bulk-archive-change` | `reference-only` | Archive multiple completed changes. |
| `openspec-sync-specs` | `reference-only` | Sync delta specs from changes into canonical specs. |
| `openspec-ff-change` | `reference-only` | Fast-forward artifact creation when explicitly requested. |
| `openspec-onboard` | `reference-only` | Guided onboarding for OpenSpec workflow usage. |
| `openspec-context-docs` | `reference-only` | Policy for where requirements and context docs belong in OpenSpec workflows. |
