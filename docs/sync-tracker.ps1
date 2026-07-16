# D-Auto Club tracker sync
#
# Makes the current progress permanent in the repo files. Typical use:
#   1. In the tracker, click "Download data" (saves progress-tracker-data.json to Downloads).
#   2. Double-click sync-tracker.bat (runs this script).
# The script offers to copy the newest downloaded data file over
# docs\progress-tracker-data.json, then re-injects that JSON into the embedded
# copy inside docs\progress-tracker.html so double-click (file://) viewers see
# the same data. Commit both files afterwards.

param(
  [string]$DownloadsDir = (Join-Path $env:USERPROFILE 'Downloads'),
  [switch]$Yes   # skip prompts (for automation/testing)
)

$ErrorActionPreference = 'Stop'
$docs     = $PSScriptRoot
$jsonPath = Join-Path $docs 'progress-tracker-data.json'
$htmlPath = Join-Path $docs 'progress-tracker.html'

Write-Host "=== D-Auto Club tracker sync ===" -ForegroundColor Cyan

if (-not (Test-Path $jsonPath)) { throw "Not found: $jsonPath" }
if (-not (Test-Path $htmlPath)) { throw "Not found: $htmlPath" }

# 1) Offer the newest downloaded data file, if it is newer than the repo copy.
$current   = Get-Item $jsonPath
$candidate = $null
try {
  $candidate = Get-ChildItem -Path $DownloadsDir -Filter 'progress-tracker-data*.json' -File -ErrorAction Stop |
               Where-Object { $_.LastWriteTime -gt $current.LastWriteTime } |
               Sort-Object LastWriteTime -Descending | Select-Object -First 1
} catch { }

if ($candidate) {
  Write-Host ("Newer download found: " + $candidate.FullName)
  $answer = 'y'
  if (-not $Yes) { $answer = Read-Host "Use it to replace docs\progress-tracker-data.json? (y/n)" }
  if ($answer -match '^[Yy]') {
    Copy-Item $candidate.FullName $jsonPath -Force
    Write-Host "Copied over docs\progress-tracker-data.json." -ForegroundColor Green
  } else {
    Write-Host "Keeping the existing docs\progress-tracker-data.json."
  }
} else {
  Write-Host "No newer download found - syncing the existing docs\progress-tracker-data.json."
}

# 2) Validate the JSON and report totals.
$jsonText = [IO.File]::ReadAllText($jsonPath)
$data = $jsonText | ConvertFrom-Json
$tasks = 0; $done = 0
foreach ($p in $data.phases) {
  foreach ($m in $p.milestones) {
    foreach ($t in $m.tasks) {
      $tasks++
      if ($t.PSObject.Properties['done'] -and $t.done) { $done++ }
    }
  }
}
Write-Host ("JSON OK: {0} tasks, {1} completed." -f $tasks, $done) -ForegroundColor Green

# 3) Re-inject the JSON into the embedded copy inside the HTML.
$html = [IO.File]::ReadAllText($htmlPath)
$pattern = '(?s)(<script type="application/json" id="tracker-data">\r?\n).*?(\r?\n</script>)'
if ($html -notmatch $pattern) { throw "Embedded data block not found in progress-tracker.html" }
$json = $jsonText.TrimEnd()
$evaluator = { param($m) $m.Groups[1].Value + $json + $m.Groups[2].Value }
$html = [regex]::Replace($html, $pattern, $evaluator)
[IO.File]::WriteAllText($htmlPath, $html, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Embedded copy inside progress-tracker.html updated." -ForegroundColor Green

Write-Host ""
Write-Host "Done. Commit progress-tracker-data.json and progress-tracker.html to share the update."
if (-not $Yes) { Read-Host "Press Enter to close" | Out-Null }
