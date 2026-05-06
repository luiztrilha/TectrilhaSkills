# Creating Public Skills

Public skills should be reusable, explainable, and safe to inspect.

## Before Publishing

- Replace real paths with placeholders.
- Remove credentials, tokens, cookies, and `.env` files.
- Remove private project names unless they are intentionally public.
- Remove memory excerpts and session summaries.
- Avoid hard-coded machine assumptions.
- Document required tools and permissions.

## Naming

Prefer short names that describe behavior:

- `verification-before-close`
- `code-review-findings`
- `playwright-interactive`

Avoid names that encode private project details.

## Output Contracts

Give the agent an exact shape for final output when consistency matters:

```text
Return:
- Findings first
- File references with line numbers
- Verification evidence
- Residual risk
```

## Promotion Rule

Promote only reusable behavior. Keep live state, local memory, and private
project procedures in private runtime docs.
