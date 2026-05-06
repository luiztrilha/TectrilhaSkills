# Skill Anatomy

A skill is a small instruction package that teaches an agent how to perform a
specific kind of work.

## Minimal Shape

```text
skill-name/
  SKILL.md
  scripts/        optional helper scripts
  examples/       optional fixtures or sample output
  templates/      optional reusable files
  assets/         optional images or support files
```

## SKILL.md Front Matter

Use front matter to make discovery explicit:

```yaml
---
name: short-skill-name
description: >
  Use when the task clearly matches this workflow.
---
```

The description should say when to use the skill, not merely what it contains.

## Body

The body should include:

- trigger rules
- constraints and safety boundaries
- step-by-step workflow
- output contract
- validation instructions
- references to scripts, examples, or templates

## Good Skill Traits

- Narrow enough to be reliable.
- Explicit about when not to run.
- Uses scripts for repeatable work.
- Avoids private paths and local secrets.
- Ends with verification expectations.
