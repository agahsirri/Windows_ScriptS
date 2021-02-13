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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Microsoft\MSOffice365
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (
      GOTO :UNSMSOFFIC
   ) ELSE (
      GOTO :INSMSOFFIC
   )

:UNSMSOFFIC
%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\AnyConnect.msi" /norestart /passive && ECHO %ComputerName% ; AnyConnect ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (ECHO %ComputerName% ; AnyConnect ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AnyConnect ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSMSOFFIC
IF NOT EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" ("%PATH_PROGRAMS%\O365ProPlus.exe" /configure "%PATH_PROGRAMS%\O365ProPlus.xml") ELSE (ECHO %ComputerName% ; MSOffice ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (ECHO %ComputerName% ; MSOffice ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MSOffice ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd