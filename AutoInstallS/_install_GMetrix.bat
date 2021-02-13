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

set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\GMetrix
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=

IF "%~1"=="u" Set Parameter1=exit /b 1

FOR /r "%ProgramFiles(x86)%\GMetrix\" %%G IN (GMetrix*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
wmic /node:"%ComputerName%" product where "Name like '%%GMetrix%%'" call uninstall && ECHO %ComputerName% ; GMetrix ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
TimeOut 1
FOR /d %%G IN ("%ProgramFiles(x86)%\GMetrix*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; GMetrix ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; GMetrix ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
TimeOut 1
DIR /a:d "%ProgramFiles(x86)%\GMetrix*" && ECHO %ComputerName% ; GMetrix ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; GMetrix ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
%Parameter1%
COLOR 07

:INSTALL
"%PATH_PROGRAMS%\GMetrix.exe" /S && ECHO %ComputerName% ; GMetrix ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /r "%ProgramFiles(x86)%\GMetrix\" %%G IN ("GMetrix.exe") DO (IF [%%G] EQU [] (ECHO %ComputerName% ; GMetrix ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE ((ECHO %ComputerName% ; GMetrix ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")&GOTO :END))

:END
%Parameter1% 
COLOR 07
EXIT /B