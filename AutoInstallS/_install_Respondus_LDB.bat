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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Respondus\LockDownBrowser
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=

REM IF "%~1"=="u" GOTO :UNINSTALL
REM IF "%~1"=="i" GOTO :ININSTALL

FOR /r "%ProgramFiles(x86)%\Respondus\LockDown Browser\" %%G IN (LockDownBrowser*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
wmic /node:"%ComputerName%" product where "Name like '%%Respondus%%'" call uninstall && ECHO %ComputerName% ; Respondus_LDB ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{BBC7F69B-7A94-41E9-8A4B-B55A8D06431F}" /f
FOR /d %%G IN ("%SystemDrive%\Software\Respondus*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles(x86)%\Respondus\LockDown Browser*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM FOR /d %%G IN ("%ProgramFiles(x86)%\MAKEMSI Package*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramData%\Respondus*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%Public%\Desktop\LockDown Browser*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d /r "%SystemDrive%\Users\" %%G IN (AppData\Local\Respondus*) DO (RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
DIR /a:d "%ProgramFiles(x86)%\Respondus\LockDown Browser*" && ECHO %ComputerName% ; Respondus_LDB ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1%
COLOR 07

:INSTALL
XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*" "%SystemDrive%\Software\Respondus_LDB\" && ECHO %ComputerName% ; Respondus_LDB ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Attrib +h "%SystemDrive%\Software" && ECHO %ComputerName% ; Respondus_LDB ; HideFolder ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; HideFolder ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemDrive%\Software\Respondus_LDB\setup.exe" /s /a /fl "%SystemDrive%\Software\Respondus_LDB\setup.iss" && ECHO %ComputerName% ; Respondus_LDB ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Respondus\LockDown Browser\LockDownBrowser.exe" (ECHO %ComputerName% ; Respondus_LDB ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Respondus_LDB ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
COPY /Y "%SystemDrive%\Software\Respondus_LDB\LockDownBrowser_run.*" "%ProgramFiles(x86)%\Respondus\LockDown Browser\" && ECHO %ComputerName% ; Respondus_LDB ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%SystemDrive%\Software\Respondus_LDB\LockDown Browser.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; Respondus_LDB ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
FOR /d %%G IN ("%SystemDrive%\Software\Respondus*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Respondus_LDB ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1%
COLOR 07
