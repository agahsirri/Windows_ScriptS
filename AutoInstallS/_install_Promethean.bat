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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Promethean\ActivInspire
set PATH_PROGRAM2=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM IF NOT EXIST "%WINDIR%\%~nx0" (GOTO :PROCESSSTART) ELSE (del /q /f "%WINDIR%\%~nx0")

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Activ Software\ActivDriver\activmgr.exe" (
      GOTO :UNSACTVDRV
   ) ELSE (
      GOTO :INSACTVDRV
   )

:UNSACTVDRV
wmic product where name="ActivDriver" call uninstall && ECHO %ComputerName% ; ActivDriver ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\ActivDriver_old.msi" /qn /norestart && ECHO %ComputerName% ; ActivDriver ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Activ Software\ActivDriver\activmgr.exe" (ECHO %ComputerName% ; ActivDriver ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; ActivDriver ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSACTVDRV
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\ActivDriver.msi" /qn /norestart && ECHO %ComputerName% ; ActivDriver ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
SC QUERYEX "ActivControl" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; ActivDriver ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; ActivDriver ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM SLEEP 60
IF EXIST "%ProgramFiles(x86)%\Activ Software\Inspire\Inspire.exe" (
      GOTO :UNSACTVINSP
   ) ELSE (
      GOTO :INSACTVINSP
   )

:UNSACTVINSP
wmic product where name="ActivInspire v2" call uninstall && ECHO %ComputerName% ; ActivInspire ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\ActivInspire_old.msi" /qn /norestart && ECHO %ComputerName% ; ActivInspire ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Activ Software\Inspire\Inspire.exe" (ECHO %ComputerName% ; ActivInspire ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; ActivInspire ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   

:INSACTVINSP
"%PATH_PROGRAM2%\FlashPlayer\uninstall_flash_player.exe" -uninstall && ECHO %ComputerName% ; FPlayer_Plugin; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAM2%\FlashPlayer\FlashPlayer_11_3_plugin.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Plugin; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\ActivInspire.msi" /qn /norestart TRANSFORMS="%PATH_PROGRAMS%\ActivInspire.mst" && ECHO %ComputerName% ; ActivInspire ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Activ Software\Inspire\Inspire.exe" (ECHO %ComputerName% ; ActivInspire ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; ActivInspire ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd