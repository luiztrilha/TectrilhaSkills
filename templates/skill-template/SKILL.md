---
name: example-skill
description: >
  Use when the task clearly requires this specific workflow.
---

# Example Skill

State the purpose in one short paragraph.

## Use When

- The task matches this repeatable workflow.
- The expected output shape matters.

## Do Not Use When

- The task is trivial.
- Repo-local instructions conflict with this skill.
- The skill would require private context that is not available.

## Workflow

1. Inspect the relevant files or inputs.
2. Apply the narrow procedure.
3. Validate the result.
4. Report evidence and residual risk.

## Output Contract

Return:

- what changed or what was found
- validation performed
- anything not verified
