param(
    [Parameter(Mandatory = $true)]
    [string]$SourcePath,

    [string]$Root = "",

    [string]$Label = ""
)

$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($Root)) {
    $Root = (Resolve-Path -Path (Join-Path $PSScriptRoot "..")).Path
} else {
    $Root = (Resolve-Path -Path $Root).Path
}

$source = (Resolve-Path -Path $SourcePath).Path

if (-not (Test-Path -Path $source -PathType Container)) {
    throw "SourcePath must be an existing directory: $SourcePath"
}

if (-not (Test-Path -Path (Join-Path $Root "AGENTS.md"))) {
    throw "Root does not look like this second-brain vault: $Root"
}

function Convert-ToSlug([string]$value) {
    $slug = $value.ToLowerInvariant()
    $slug = $slug -replace '[^a-z0-9]+', '-'
    $slug = $slug.Trim('-')
    if ([string]::IsNullOrWhiteSpace($slug)) { return "capture" }
    return $slug
}

$folderName = Split-Path -Leaf $source
if (-not [string]::IsNullOrWhiteSpace($Label)) {
    $folderName = $Label
}

$date = Get-Date -Format "yyyy-MM-dd"
$destName = "$date-$(Convert-ToSlug $folderName)"
$destRoot = Join-Path $Root (Join-Path "raw\inbox" $destName)
New-Item -ItemType Directory -Force -Path $destRoot | Out-Null

$manifestPath = Join-Path $destRoot "capture_manifest.jsonl"
$files = Get-ChildItem -Path $source -Recurse -File -Force
$captured = 0

foreach ($file in $files) {
    $relative = $file.FullName.Substring($source.Length).TrimStart('\', '/')
    $dest = Join-Path $destRoot $relative
    $destDir = Split-Path -Parent $dest
    New-Item -ItemType Directory -Force -Path $destDir | Out-Null
    Copy-Item -LiteralPath $file.FullName -Destination $dest -Force
    $hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $dest).Hash
    $record = [ordered]@{
        source_path = $file.FullName
        captured_path = $dest.Substring($Root.Length).TrimStart('\', '/')
        size_bytes = $file.Length
        sha256 = $hash
        captured_at = (Get-Date).ToString("s")
        status = "captured"
    }
    ($record | ConvertTo-Json -Compress) | Add-Content -Path $manifestPath -Encoding UTF8
    $captured += 1
}

$logPath = Join-Path $Root "wiki\log.md"
$relativeBatch = $destRoot.Substring($Root.Length).TrimStart('\', '/')
$entry = @"

## $date - capture-folder

- Captured external folder: `$source`
- Destination batch: `$relativeBatch`
- Files captured: $captured
- Status: capture-only; wiki synthesis deferred until dream sequence.
"@
Add-Content -Path $logPath -Value $entry -Encoding UTF8

Write-Output "Captured $captured files to $destRoot"
