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

## Launch A Shared MCP Wrapper

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\mcp\launch_github_mcp.ps1
```

Keep shared MCP launchers in a neutral workspace layer when they are part of a
general agent environment and not owned by a single app runtime.

## Run A Local AI Helper

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -File .\scripts\local-ai\Invoke-LocalVisionInsight.ps1 -InputPath "D:\path\file.pdf"
```

Keep the wrapper, helper module, prompt builder, config JSON, and Python helper
scripts together in the same directory tree so the tool does not depend on an
unrelated product repo at runtime.

## Keep Output Raw Unless Asked

Do not pipe command output into summarizers unless the user explicitly asks for
that workflow in the current task.
