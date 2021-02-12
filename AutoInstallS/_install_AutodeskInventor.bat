@ECHO off
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

set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Autodesk\Inventor2019
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=

IF "%~1"=="-u" Set Parameter1=exit /b 1

FOR /r "%ProgramFiles%\Autodesk\" %%G IN (Bin\Inventor*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
wmic /node:"%ComputerName%" product where "Name like '%%Inventor%%'" call uninstall && ECHO %ComputerName% ; AutodeskInventor ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%SystemDrive%\Software\Inventor*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles%\Autodesk\Inventor*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramData%\Autodesk\Inventor*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%Public%\Documents\Autodesk\Inventor*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d /r "%SystemDrive%\Users\" %%G IN (AppData\Local\Autodesk\Inventor*) DO (RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%%~G" ; OK ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
DIR /a:d "%ProgramFiles%\Autodesk\Inventor*" && ECHO %ComputerName% ; AutodeskInventor ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1% 
COLOR 07

:INSTALL
XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*" "%SystemDrive%\Software\Inventor2019\" && ECHO %ComputerName% ; AutodeskInventor2019 ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor2019 ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Attrib +h "%SystemDrive%\Software" && ECHO %ComputerName% ; AutodeskInventor2019 ; HideFolder ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor2019 ; HideFolder ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Autodesk\Inventor 2019\bin\Inventor.exe" "%SystemDrive%\Software\Inventor2019\Img\Setup.exe" /W /Q /I %SystemDrive%\Software\Inventor2019\Img\AutodeskInventor2019.ini /language en-us && ECHO %ComputerName% ; AutodeskInventor2019 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Autodesk\Inventor 2019\bin\Inventor.exe" ((ECHO %ComputerName% ; AutodeskInventor2019 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") & (RMDIR /S /Q "%SystemDrive%\Software\Inventor2019"&& ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%SystemDrive%\Software\Inventor2019" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventor ; Deleted_"%SystemDrive%\Software\Inventor2019" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")) ELSE (ECHO %ComputerName% ; AutodeskInventor2019 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
%Parameter1% 
COLOR 07
