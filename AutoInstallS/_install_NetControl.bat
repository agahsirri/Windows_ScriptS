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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\NetControl2
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM IF NOT EXIST "%WINDIR%\%~nx0" (GOTO :PROCESSSTART) ELSE (del /q /f "%WINDIR%\%~nx0")

REM pushd %_CUR_PATH%

REM :PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Net Control 2 Classroom\nstudent.exe" (
      GOTO :UNSNETCTRL
   ) ELSE (
      GOTO :INSNETCTRL
   )

:UNSNETCTRL
"%ProgramFiles(x86)%\Net Control 2 Classroom\unins000.exe" /SILENT /NORESTART && ECHO %ComputerName% ; NetControl ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Net Control 2 Classroom\unins000.exe" (ECHO %ComputerName% ; NetControl ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; NetControl ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSNETCTRL
"%PATH_PROGRAMS%\net1200r.exe" /SILENT /COMPONENTS="user comm drv lspm\ho" /NORESTART && ECHO %ComputerName% ; NetControl2_usr ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM Seminole Science Charter School, TIL9V-GBFNA-P9J0P-190LK-P48I0B
SC QUERYEX "NetControl2Server" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; NetControl2_usr ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; NetControl2_usr ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd