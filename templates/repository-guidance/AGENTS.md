# Repo Agent Notes

Describe the repository purpose in one paragraph.

Working rules:

- Follow explicit user instructions first.
- Follow this repo's local rules before global agent preferences.
- Keep secrets, tokens, browser profiles, runtime state and private data out of
  the repository.
- Do not mutate protected files without explicit approval.
- Prefer small, reviewable changes.
- Update product, architecture, design or operation docs when behavior changes.
- Run the narrowest useful validation before claiming completion.
- Report what was verified, what was skipped and what remains risky.

Protected files:

- `<add protected files here>`

Validation:

```powershell
<setup command>
<test command>
<build command>
```
