@ECHO off
CLS
COLOR 0C
ECHO            ________________________LEGAL DISCLAIMER AND NOTICES_______________________
ECHO           ^|                                                                          ^|
ECHO           ^|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR^|
ECHO           ^| IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, ^|
ECHO           ^| FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  ^|
ECHO           ^|THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER^|
ECHO           ^| LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  ^|
ECHO           ^|   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    ^|
ECHO           ^|                     DEALINGS IN THE SOFTWARE.                            ^|
ECHO           ^|                                                                          ^|
ECHO           ^|               This code(s) is developed by Agah Sirri,                   ^|
ECHO           ^|         AgahSirri@hotmail.com / https://linkedin.com/in/agahsirri        ^|
ECHO           ^|                                 https://github.com/agahsirri             ^|
ECHO           ^|__________________________________________________________________________^|
ECHO .
ECHO [Press CTRL + C for an interrupt the process]
TimeOut 10
ECHO .
COLOR 0A

@ECHO OFF
CLS
set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\_ScriptS
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "DefaultDomainName" /d "" && ECHO %ComputerName% ; Registery_Key_Del ; DefaultDomainName ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Del ; DefaultDomainName ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "DefaultUserName" /d "" && ECHO %ComputerName% ; Registery_Key_Del ; DefaultUserName ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Del ; DefaultUserName ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" DELETE "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /v "DefaultPassword" && ECHO %ComputerName% ; Registery_Key_Del ; DefaultPassword ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Del ; DefaultPassword ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "AutoAdminLogon" /d "0" && ECHO %ComputerName% ; Registery_Key_Del ; AutoAdminLogon ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Del ; AutoAdminLogon ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /f /t REG_DWORD /v "NoLockScreen" /d "0" && ECHO %ComputerName% ; Registery_Key_Del ; NoLockScreen ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Del ; NoLockScreen ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
