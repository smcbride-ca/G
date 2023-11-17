do {
    $homeDir = [Environment]::GetFolderPath("UserProfile")
    $exePath = Join-Path $homeDir "GooseTrollware\Desktop Goose v0.31\DesktopGoose v0.31\GooseDesktop.exe"
    do {
        Start-Process -FilePath $exePath -Wait
        Start-Sleep -Seconds 5
    } while ($true)
} while ($true)