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

set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\TeamViewer
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\TeamViewer\TeamViewer.exe" (
      GOTO :UNSTEAMVIEW
   ) ELSE (
      GOTO :INSTEAMVIEW
   )

:UNSTEAMVIEW
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\TeamViewer.msi" /qn /norestart && ECHO %ComputerName% ; TeamViewer ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM wmic /node:"." product where "Name like '%TeamViewer%'" call uninstall && ECHO %ComputerName% ; TeamViewer ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\TeamViewer\TeamViewer.exe" (ECHO %ComputerName% ; TeamViewer ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TeamViewer ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSTEAMVIEW
"%WinDir%\Regedit.exe" /s "%PROCESS%\TeamViewer.reg" && ECHO %ComputerName% ; TeamViewer_Reg ; Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TeamViewer_Reg ; Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TeamViewer.msi" /qn /norestart && ECHO %ComputerName% ; TeamViewer ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

SC QUERYEX "TeamViewer" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; TeamViewer ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; TeamViewer ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd