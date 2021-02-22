;
; AutoIt Version: 3.3
; Language:       English
; Platform:       Win2000/XP/Vista/2008
; Author:         Michael Ward
;
; Script Function:
;   Connects to a remote registry using regedit
;
#requireadmin
 
if ($CmdLine[0] > 0) Then
    $hostname = $CmdLine[1]
Else
    MsgBox(48,"Error","No Hostname Specified",60)
    Exit(1)
EndIf
 
; Run Regedit
Run("regedit.exe")
 
 
; Wait for the regedit to become active
WinWaitActive("Registry Editor")
 
; Connect to the remote registry
Send("!f")
Send("c")
WinWaitActive("Select Computer")
Send($hostname)
Send("{ENTER}")
 
; Finished!