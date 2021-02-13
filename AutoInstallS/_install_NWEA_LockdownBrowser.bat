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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\NWEA_LockdownBrowser
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (
      GOTO :UNSLOCKDOWN
   ) ELSE (
      GOTO :INSLOCKDOWN
   )

:UNSLOCKDOWN
IF EXIST "%ProgramFiles(x86)%\NWEA\Lockdown Browser\Lockdown Browser.exe" wmic product where name="Lockdown Browser" call uninstall
IF NOT EXIST "%ProgramFiles(x86)%\NWEA\Lockdown Browser\Lockdown Browser.exe" (ECHO %ComputerName% ; LockdownBrowser1 ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser1 ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" wmic product where name="Lockdown Browser" call uninstall
IF NOT EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (ECHO %ComputerName% ; LockdownBrowser2 ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser2 ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSLOCKDOWN
"%PATH_PROGRAMS%\LockdownBrowser.exe" /S /v/qn && ECHO %ComputerName% ; LockdownBrowser ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (ECHO %ComputerName% ; LockdownBrowser ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd