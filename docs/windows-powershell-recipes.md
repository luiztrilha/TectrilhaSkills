# Windows PowerShell Recipes

Use PowerShell commands that are readable, auditable, and easy to rerun.

## Inspect A Skill

```powershell
Get-ChildItem -Recurse -File .\my-skill
Get-Content .\my-skill\SKILL.md
```

## Search For Risky Content

```powershell
rg -n "token|secret|password|api_key|auth|cookie|sqlite|history|session|Remove-Item|rm -rf|Invoke-WebRequest|curl" .\my-skill
```

## Compare Versions

```powershell
git diff -- .\skills\my-skill
```

## Validate Markdown Links Manually

```powershell
rg -n "\]\(" .\README.md .\docs .\catalog
```

## Keep Output Raw Unless Asked

Do not pipe command output into summarizers unless the user explicitly asks for
that workflow in the current task.
