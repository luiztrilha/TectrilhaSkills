param(
    [string]$TectrilhaSkillsRoot,
    [string]$CodexHome = (Join-Path $env:USERPROFILE ".codex"),
    [string]$AgentsHome = (Join-Path $env:USERPROFILE ".agents"),
    [string]$DunderiaRoot,
    [switch]$Json,
    [string[]]$RepoRoots = @()
)

if (-not $TectrilhaSkillsRoot) {
    $TectrilhaSkillsRoot = Split-Path -Parent $PSScriptRoot
}

$defaultRepoRoot = Split-Path -Parent $TectrilhaSkillsRoot
if (-not $DunderiaRoot) {
    $DunderiaRoot = Join-Path $defaultRepoRoot "dunderia"
}

if ($RepoRoots.Count -eq 0) {
    $RepoRoots = @($defaultRepoRoot)
    if ($env:TECTRILHA_REPO_ROOTS) {
        $RepoRoots += @($env:TECTRILHA_REPO_ROOTS -split ';' | Where-Object { $_ })
    }
}

$findings = New-Object System.Collections.Generic.List[object]

function Add-Finding {
    param(
        [string]$Area,
        [ValidateSet("ok", "review", "info")]
        [string]$Status,
        [string]$Summary,
        [string[]]$Details = @(),
        [string]$Recommendation = ""
    )

    $script:findings.Add([pscustomobject]@{
        area = $Area
        status = $Status
        summary = $Summary
        details = @($Details)
        recommendation = $Recommendation
    }) | Out-Null
}

function Read-TextSafe {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
        return $null
    }

    try {
        return Get-Content -LiteralPath $Path -Raw -ErrorAction Stop
    }
    catch {
        return $null
    }
}

function Get-GitStatusSafe {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath (Join-Path $Path ".git"))) {
        return [pscustomobject]@{
            ok = $false
            lines = @()
        }
    }

    try {
        $output = @(& git -C $Path status --short 2>$null)
        if ($LASTEXITCODE -ne 0) {
            return [pscustomobject]@{
                ok = $false
                lines = @()
            }
        }
        return [pscustomobject]@{
            ok = $true
            lines = $output
        }
    }
    catch {
        return [pscustomobject]@{
            ok = $false
            lines = @()
        }
    }
}

function Get-DirectoryNames {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        return @()
    }

    return @(Get-ChildItem -LiteralPath $Path -Directory -Force -ErrorAction SilentlyContinue |
        ForEach-Object { $_.Name })
}

function Get-CatalogedSkillNames {
    param([string]$CatalogPath)

    $content = Read-TextSafe -Path $CatalogPath
    if (-not $content) {
        return @()
    }

    $names = New-Object System.Collections.Generic.HashSet[string] ([StringComparer]::OrdinalIgnoreCase)
    foreach ($line in ($content -split "`r?`n")) {
        if ($line -match '^\|\s*`([^`]+)`\s*\|') {
            $null = $names.Add($Matches[1])
        }
    }

    return @($names | Sort-Object)
}

function Get-InstalledSkillNames {
    param(
        [string]$CodexHome,
        [string]$AgentsHome
    )

    $names = New-Object System.Collections.Generic.HashSet[string] ([StringComparer]::OrdinalIgnoreCase)

    foreach ($name in (Get-DirectoryNames -Path (Join-Path $CodexHome "skills"))) {
        if ($name -ne ".system") {
            $null = $names.Add($name)
        }
    }

    foreach ($name in (Get-DirectoryNames -Path (Join-Path $CodexHome "skills\.system"))) {
        $null = $names.Add($name)
    }

    foreach ($name in (Get-DirectoryNames -Path (Join-Path $CodexHome "superpowers\skills"))) {
        $null = $names.Add($name)
    }

    foreach ($name in (Get-DirectoryNames -Path (Join-Path $AgentsHome "skills"))) {
        $null = $names.Add($name)
    }

    return @($names | Sort-Object)
}

$requiredFiles = @(
    "README.md",
    "AGENT-USAGE.md",
    "catalog/skills.md",
    "catalog/mcps.md",
    "docs/environment-usage-patterns.md",
    "docs/agent-forward-repository-template.md",
    "templates/repository-guidance/AGENTS.md"
)

$missingRequired = @()
foreach ($relativePath in $requiredFiles) {
    $fullPath = Join-Path $TectrilhaSkillsRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        $missingRequired += $relativePath
    }
}

if ($missingRequired.Count -eq 0) {
    Add-Finding -Area "repository" -Status "ok" -Summary "Core guide files are present." -Details $requiredFiles
}
else {
    Add-Finding -Area "repository" -Status "review" -Summary "Core guide files are missing." -Details $missingRequired -Recommendation "Restore or recreate these files before treating the public guide as current."
}

$codexAgents = Read-TextSafe -Path (Join-Path $CodexHome "AGENTS.md")
if ($codexAgents -and $codexAgents -match "TectrilhaSkills") {
    Add-Finding -Area "global-instructions" -Status "ok" -Summary "Global Codex instructions mention TectrilhaSkills."
}
else {
    Add-Finding -Area "global-instructions" -Status "review" -Summary "Global Codex instructions do not mention TectrilhaSkills." -Recommendation "Add a public-safe rule to keep TectrilhaSkills updated when reusable skills or policies change."
}

$dunderiaAgents = Read-TextSafe -Path (Join-Path $DunderiaRoot "AGENTS.md")
if ($dunderiaAgents -and $dunderiaAgents -match "TectrilhaSkills") {
    Add-Finding -Area "dunderia-instructions" -Status "ok" -Summary "DunderIA repo instructions mention TectrilhaSkills."
}
else {
    Add-Finding -Area "dunderia-instructions" -Status "review" -Summary "DunderIA repo instructions do not mention TectrilhaSkills." -Recommendation "If DunderIA changes reusable skill patterns, add a repo-local reminder to update this guide."
}

$codexConfig = Read-TextSafe -Path (Join-Path $CodexHome "config.toml")
$trustedRootMentioned = $false
if ($codexConfig) {
    foreach ($repoRoot in $RepoRoots) {
        if ($codexConfig -match [regex]::Escape($repoRoot)) {
            $trustedRootMentioned = $true
        }
    }
}

if ($codexConfig -and ($trustedRootMentioned -or $codexConfig -match "TectrilhaSkills")) {
    Add-Finding -Area "codex-trust" -Status "ok" -Summary "Codex config appears to trust the repo root or TectrilhaSkills checkout."
}
else {
    Add-Finding -Area "codex-trust" -Status "review" -Summary "Codex config does not show an obvious trusted path for TectrilhaSkills." -Recommendation "Review trusted workspace roots before expecting agents to read the guide automatically."
}

foreach ($repoRoot in $RepoRoots) {
    $checkout = Join-Path $repoRoot "TectrilhaSkills"
    if (-not (Test-Path -LiteralPath $checkout -PathType Container)) {
        Add-Finding -Area "checkout" -Status "info" -Summary "TectrilhaSkills checkout not found." -Details @($checkout)
        continue
    }

    $statusResult = Get-GitStatusSafe -Path $checkout
    if (-not $statusResult.ok) {
        Add-Finding -Area "checkout" -Status "info" -Summary "Checkout exists but git status was not available." -Details @($checkout)
    }
    elseif ($statusResult.lines.Count -eq 0) {
        Add-Finding -Area "checkout" -Status "ok" -Summary "Checkout is clean." -Details @($checkout)
    }
    else {
        Add-Finding -Area "checkout" -Status "review" -Summary "Checkout has uncommitted changes." -Details @($checkout, ($statusResult.lines -join "; ")) -Recommendation "Review and commit or discard intentionally before using this checkout as the current public reference."
    }
}

$catalogedSkills = Get-CatalogedSkillNames -CatalogPath (Join-Path $TectrilhaSkillsRoot "catalog/skills.md")
$installedSkills = Get-InstalledSkillNames -CodexHome $CodexHome -AgentsHome $AgentsHome
$catalogedSet = New-Object System.Collections.Generic.HashSet[string] ([StringComparer]::OrdinalIgnoreCase)
$installedSet = New-Object System.Collections.Generic.HashSet[string] ([StringComparer]::OrdinalIgnoreCase)
foreach ($name in $catalogedSkills) { $null = $catalogedSet.Add($name) }
foreach ($name in $installedSkills) { $null = $installedSet.Add($name) }

$installedNotCataloged = @($installedSkills | Where-Object { -not $catalogedSet.Contains($_) })
$catalogedNotInstalled = @($catalogedSkills | Where-Object { -not $installedSet.Contains($_) })

if ($installedNotCataloged.Count -eq 0) {
    Add-Finding -Area "skills" -Status "ok" -Summary "Installed local skills are represented in the public catalog."
}
else {
    Add-Finding -Area "skills" -Status "review" -Summary "Some installed local skills are not represented in the public catalog." -Details $installedNotCataloged -Recommendation "Catalog the public-safe behavior or mark the skill private/excluded."
}

if ($catalogedNotInstalled.Count -gt 0) {
    Add-Finding -Area "skills" -Status "info" -Summary "Some catalog entries are not installed locally." -Details $catalogedNotInstalled -Recommendation "This is acceptable when entries are reference-only or snapshot-only."
}

$templateRoot = Join-Path $TectrilhaSkillsRoot "templates"
$dangerMatches = @()
if (Test-Path -LiteralPath $templateRoot -PathType Container) {
    $patterns = @(
        "danger-full-access",
        'approval_policy\s*=\s*"never"',
        "STITCH_API_KEY\s*=",
        "ACCESS_TOKEN\s*=",
        "PASSWORD\s*="
    )
    foreach ($file in (Get-ChildItem -LiteralPath $templateRoot -Recurse -File -ErrorAction SilentlyContinue)) {
        $text = Read-TextSafe -Path $file.FullName
        if (-not $text) { continue }
        foreach ($pattern in $patterns) {
            if ($text -match $pattern) {
                $dangerMatches += "$($file.FullName.Substring($TectrilhaSkillsRoot.Length).TrimStart('\','/')) :: $pattern"
            }
        }
    }
}

if ($dangerMatches.Count -eq 0) {
    Add-Finding -Area "templates" -Status "ok" -Summary "Templates do not contain known unsafe runtime defaults or obvious secret placeholders with values."
}
else {
    Add-Finding -Area "templates" -Status "review" -Summary "Templates contain strings that need security review." -Details $dangerMatches -Recommendation "Remove unsafe runtime defaults and replace secret-like values with documented placeholders."
}

$generatedAt = (Get-Date).ToString("s")
$findingArray = @()
foreach ($finding in $findings) {
    $findingArray += $finding
}

$result = [pscustomobject]@{
    generated_at = $generatedAt
    tectrilha_skills_root = $TectrilhaSkillsRoot
    applied_changes = $false
    findings = $findingArray
}

if ($Json) {
    $result | ConvertTo-Json -Depth 6
    exit 0
}

"# TectrilhaSkills Environment Sync Preview"
""
"Generated at: $generatedAt"
""
"No changes were applied."
""
"## Findings"
""
foreach ($finding in $findings) {
    "- [$($finding.status.ToUpperInvariant())] $($finding.area): $($finding.summary)"
    foreach ($detail in $finding.details) {
        "  - $detail"
    }
    if ($finding.recommendation) {
        "  - Recommendation: $($finding.recommendation)"
    }
}
