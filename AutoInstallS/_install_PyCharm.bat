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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\PyCharm
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (
      GOTO :UNSPYCHARM
   ) ELSE (
      GOTO :INSPYCHARM
   )

:UNSPYCHARM
"%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\Uninstall.exe" /S && ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSPYCHARM
"%PATH_PROGRAMS%\PyCharmCommunity.exe" /S && ECHO %ComputerName% ; PyCharmCommunity ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; PyCharmCommunity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (ECHO %ComputerName% ; PyCharmCommunity ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; PyCharmCommunity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\pycharm64.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; PyCharm ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; PyCharm ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM popd