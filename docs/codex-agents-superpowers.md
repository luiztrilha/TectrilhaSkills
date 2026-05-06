# Codex, Agents, And Superpowers

Different runtimes can use similar skill ideas, but their packaging and trigger
rules may differ.

## Codex Skills

Codex skills are usually Markdown-first instruction packages. They work best
when they define:

- when to trigger
- what files/scripts to inspect
- how to validate the result
- how to report evidence

## Agents Skills

Agents skills often focus on design, UX, frontend, or workflow guidance. Keep
them domain-specific and avoid turning them into broad style dumps.

## Superpowers

Superpowers are workflow disciplines such as planning, debugging, TDD,
verification, or parallel work. They are most useful when they enforce a process
that prevents common mistakes.

## Precedence

Always let these take priority:

1. explicit user instruction
2. repo-local `AGENTS.md`
3. task-specific docs
4. active runtime policy
5. reusable skill guidance
