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