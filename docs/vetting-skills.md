# Vetting Skills

Vetting is the safety pass before installing or publishing a skill.

## Red Flags

- Hidden network calls.
- Destructive filesystem commands.
- Broad shell execution without explanation.
- Requests to disable sandboxing or approvals by default.
- Tokens, keys, cookies, or OAuth files.
- Private paths, local usernames, or database connection details.
- Instructions that override repo-local or user instructions.

## Search Checklist

Search the candidate skill for:

```text
token
secret
password
api_key
auth
cookie
sqlite
history
session
Remove-Item
rm -rf
Invoke-WebRequest
curl
```

## Decision

- **Accept** when the skill is narrow, readable, and public-safe.
- **Edit** when useful behavior exists but local assumptions need removal.
- **Reject** when the skill hides risky actions or cannot be audited.
