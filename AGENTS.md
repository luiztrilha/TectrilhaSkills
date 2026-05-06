# Repo Agent Notes

This repository is the public guide for reusable agent skills and capability
patterns.

Working rules:

- Keep the repo public-safe. Do not add secrets, tokens, cookies, OAuth state,
  browser profiles, runtime memories, sessions, telemetry, raw config, local
  databases, broker state, company state, or private project helpers.
- When a reusable skill, skill workflow, vetting rule, install recipe, or agent
  capability pattern is added here, update the relevant docs, catalog entry,
  template, or example in the same change.
- When a reusable skill or skill policy changes in the global Codex/Agents/
  Superpowers environment, reflect the public-safe part here too.
- Prefer portable placeholders over machine-specific paths.
- Keep examples small and inspectable.
- Use `examples/` for public example skills, `templates/` for starter material,
  `docs/` for guidance, and `catalog/` for skill summaries.
- Do not publish private database helpers or project-specific operational
  procedures as general skills.
