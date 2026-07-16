@echo off
rem Double-click me after using "Download data" in the tracker.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0sync-tracker.ps1"
