REM @ECHO off
CLS
COLOR 0C
ECHO  __________________________________________________________________________
ECHO ^|                                                                          ^|
ECHO ^|THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR^|
ECHO ^| IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, ^|
ECHO ^| FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL  ^|
ECHO ^|THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER^|
ECHO ^| LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING  ^|
ECHO ^|   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER    ^|
ECHO ^|                     DEALINGS IN THE SOFTWARE.                            ^|
ECHO ^|                                                                          ^|
ECHO ^|               This code(s) is developed by Agah Sirri,                   ^|
ECHO ^|         AgahSirri@hotmail.com / http://linkedin.com/in/agahsirri         ^|
ECHO ^|__________________________________________________________________________^|
ECHO
ECHO [Press CTRL + C for an interrupt the process]
TimeOut 10
ECHO
COLOR 0A

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\CBSecureBrowser
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=

REM IF "%~1"=="u" (Set Parameter1=EXIT /b) & GOTO :UNINSTALL
REM IF "%~1"=="i" (Set Parameter1=EXIT /b) & GOTO :ININSTALL
REM IF "%~1"=="u" GOTO :UNINSTALL
REM IF "%~1"=="i" GOTO :ININSTALL


FOR /r "%ProgramFiles(x86)%\CBSecureBrowser\" %%G IN (CBSecureBrowser*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
wmic /node:"%ComputerName%" product where "Name like '%%CBSecureBrowser%%'" call uninstall && ECHO %ComputerName% ; CBSecureBrowser ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%SystemDrive%\Software\CBSecureBrowser*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles(x86)%\CBSecureBrowse*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles(x86)%\MAKEMSI Package*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramData%\CBSecureBrowser*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%Public%\Documents\CBSecureBrowser*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d /r "%SystemDrive%\Users\" %%G IN (AppData\Local\CAI\CBSecureBrowser*) DO (RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; Deleted_"%%~G" ; OK ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
DIR /a:d "%ProgramFiles(x86)%\CBSecureBrowse*" && ECHO %ComputerName% ; CBSecureBrowser ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; CBSecureBrowser ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM %Parameter1%
REM EXIT /b 1
COLOR 07

:INSTALL
REM XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*" "%SystemDrive%\Software\Inventor2019\" && ECHO %ComputerName% ; AutodeskInventor2019 ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor2019 ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM Attrib +h "%SystemDrive%\Software" && ECHO %ComputerName% ; AutodeskInventor2019 ; HideFolder ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor2019 ; HideFolder ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles%\Autodesk\Inventor 2019\bin\Inventor.exe" "%SystemDrive%\Software\Inventor2019\Img\Setup.exe" /W /Q /I %SystemDrive%\Software\Inventor2019\Img\AutodeskInventor2019.ini /language en-us && ECHO %ComputerName% ; AutodeskInventor2019 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

"%Windir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\CBSecureBrowser.msi" /qn /norestart && ECHO %ComputerName% ; CBSecureBrowser ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\CBSecureBrowser\CBSecureBrowser.exe" (ECHO %ComputerName% ; CBSecureBrowser ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; CBSecureBrowser ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
REM %Parameter1%
REM EXIT /b 1
COLOR 07
