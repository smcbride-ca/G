@echo off
setlocal
set "psFile=%userprofile%\GooseTrollware\start.ps1"

echo Running PowerShell script...
powershell.exe -ExecutionPolicy Bypass -File "%psFile%"
echo PowerShell script run command sent.