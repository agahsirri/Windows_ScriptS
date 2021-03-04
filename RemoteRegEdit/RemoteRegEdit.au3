;            ________________________LEGAL DISCLAIMER AND NOTICES_______________________
;           |                                                                          |
;           |THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR|
;           | IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, |
;           | FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  |
;           |THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER|
;           | LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  |
;           |   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    |
;           |                     DEALINGS IN THE SOFTWARE.                            |
;           |                                                                          |
;           |               This code(s) is developed by Agah Sirri,                   |
;           |         AgahSirri@hotmail.com / https://linkedin.com/in/agahsirri        |
;           |                                 https://github.com/agahsirri             |
;           |__________________________________________________________________________|

#requireadmin
if ($CmdLine[0] > 0) Then
    $RemoteHostname = $CmdLine[1]
Else
    MsgBox(48,"Error","There i no certain Hostname",60)
    Exit(1)
EndIf
Run("regedit.exe")
WinWaitActive("Registry Editor")
Send("!f")
Send("c")
WinWaitActive("Select Computer")
Send($RemoteHostname)
Send("{ENTER}")
Sleep(500)
; Finished!