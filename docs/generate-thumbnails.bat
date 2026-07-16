@echo off
rem Regenerates gallery thumbnails from progress-tracker-data.json.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0generate-thumbnails.ps1" %*
pause
