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

set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\TestNav
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=

IF "%~1"=="u" Set Parameter1=exit /b 1

FOR /r "%ProgramFiles(x86)%\TestNav\" %%G IN (TestNav*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
taskkill /IM "TestNav.exe" /F
wmic /node:"%ComputerName%" product where "Name like '%%TestNav%%'" call uninstall && ECHO %ComputerName% ; TestNav ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles%\TestNav*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; TestNav ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TestNav ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
DIR /a:d "%ProgramFiles(x86)%\TestNav*" && ECHO %ComputerName% ; TestNav ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TestNav ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1% 
COLOR 07

:INSTALL
IF NOT EXIST "%ProgramFiles(x86)%\TestNav\TestNav.exe" "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TestNav.msi" /qn /norestart && ECHO %ComputerName% ; TestNav ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\TestNav\TestNav.exe" (ECHO %ComputerName% ; TestNav ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TestNav ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\TestNav_run.*" "%ProgramFiles(x86)%\TestNav\" && ECHO %ComputerName% ; TestNav_run ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TestNav_run ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\TestNav.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; TestNav ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TestNav ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1% 
COLOR 07
