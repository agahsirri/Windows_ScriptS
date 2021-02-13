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

set PATH_PROGRAMS=\\172.2.2.4\c$\Software\ProgramS\TightVNC
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.2.4\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

:PROCESSSTART
"%WinDir%\Regedit.exe" /s "%PATH_PROCESS%\_install_TightVNC.reg" && ECHO %ComputerName% ; TightVNC ; Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TightVNC ; Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\TightVNC\tvnserver.exe" (
    "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\TightVNCx64.msi" /norestart /passive && ECHO %ComputerName% ; TightVNC ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
    IF NOT EXIST "%ProgramFiles%\TightVNC\tvnserver.exe" (ECHO %ComputerName% ; TightVNC ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TightVNC ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
    SC STOP "tvnserver"
    TIMEOUT 10
    SC START "tvnserver"
   ) ELSE (
    "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TightVNCx64.msi" /norestart /passive && ECHO %ComputerName% ; TightVNC ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
    SC START "tvnserver"
    TIMEOUT 10
    SC QUERYEX "tvnserver" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; TightVNC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; TightVNC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   )

REM popd