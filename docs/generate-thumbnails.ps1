# D-Auto Club tracker - gallery thumbnail generator
#
# Reads the "gallery" section of progress-tracker-data.json and renders a small
# cropped JPEG preview of every image into docs\gallery-thumbs\.
# The tracker's gallery grid loads these thumbnails (fast) and only loads the
# full-size original when an image is opened in the lightbox.
#
# Thumbnail naming convention (the tracker page computes the same names):
#   gallery-thumbs\g<groupIndex>_<original file name>.jpg
#
# Run again after adding images to the gallery; existing thumbnails are kept
# unless -Force is used.

param([switch]$Force)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Drawing

$docs = $PSScriptRoot
$data = Get-Content (Join-Path $docs 'progress-tracker-data.json') -Raw | ConvertFrom-Json
if (-not $data.gallery) { Write-Host "No gallery section in the data file - nothing to do."; exit 0 }

$outDir = Join-Path $docs 'gallery-thumbs'
New-Item -ItemType Directory -Force $outDir | Out-Null

# 2x the grid tile size (190x170 CSS px) for crisp thumbnails on HiDPI screens.
$tileW = 380; $tileH = 340
$aspect = $tileW / $tileH

$made = 0; $skipped = 0; $failed = 0
$gi = 0
foreach ($g in $data.gallery) {
  foreach ($img in $g.images) {
    $srcPath = [IO.Path]::GetFullPath((Join-Path $docs (($g.dir -replace '/', '\') + $img.file)))
    $base = [IO.Path]::GetFileNameWithoutExtension($img.file)
    $dst = Join-Path $outDir ("g$gi" + "_" + $base + ".jpg")

    if (-not (Test-Path $srcPath)) { Write-Host ("  MISSING source: " + $srcPath) -ForegroundColor Yellow; $failed++; continue }
    if ((Test-Path $dst) -and -not $Force) { $skipped++; continue }

    try {
      $src = [System.Drawing.Image]::FromFile($srcPath)
      # Crop region replicating the grid's object-fit:cover / object-position:top:
      # wide images -> full-height strip centred horizontally; tall images -> top band.
      if (($src.Width / $src.Height) -gt $aspect) {
        $cropH = $src.Height
        $cropW = [int]($src.Height * $aspect)
        $cropX = [int](($src.Width - $cropW) / 2); $cropY = 0
      } else {
        $cropW = $src.Width
        $cropH = [int]($src.Width / $aspect)
        $cropX = 0; $cropY = 0
      }
      $thumb = New-Object System.Drawing.Bitmap $tileW, $tileH
      $gfx = [System.Drawing.Graphics]::FromImage($thumb)
      $gfx.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
      $gfx.Clear([System.Drawing.Color]::White)
      $destRect = New-Object System.Drawing.Rectangle 0, 0, $tileW, $tileH
      $gfx.DrawImage($src, $destRect, $cropX, $cropY, $cropW, $cropH, [System.Drawing.GraphicsUnit]::Pixel)

      $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
      $ep = New-Object System.Drawing.Imaging.EncoderParameters 1
      $ep.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]82)
      $thumb.Save($dst, $codec, $ep)

      $gfx.Dispose(); $thumb.Dispose(); $src.Dispose()
      $made++
      Write-Host ("  OK  " + [IO.Path]::GetFileName($dst))
    } catch {
      Write-Host ("  FAIL " + $img.file + " - " + $_.Exception.Message) -ForegroundColor Red
      $failed++
    }
  }
  $gi++
}

Write-Host ""
Write-Host ("Thumbnails: {0} created, {1} already existed, {2} failed." -f $made, $skipped, $failed) -ForegroundColor Green
