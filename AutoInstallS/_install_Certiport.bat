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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Certiport
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "C:\Certiport\Console\CertiportConsole.exe" (
      GOTO :UNSCERTIPORT
   ) ELSE (
      GOTO :INSCERTIPORT
   )

:UNSCERTIPORT
"C:\Certiport\Compass\Uninstaller.exe" /S && ECHO %ComputerName% ; Certiport_Compass ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"C:\Certiport\Console\Uninstall.exe" /S && ECHO %ComputerName% ; Certiport_Console ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%ProgramFiles(x86)%\Certiport\Certiport Update Service\uninstall.exe" /S && ECHO %ComputerName% ; Certiport ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "C:\Certiport\Compass\AppLauncher.exe" (ECHO %ComputerName% ; Certiport_Compass ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Compass ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "C:\Certiport\Console\CertiportConsole.exe" (ECHO %ComputerName% ; Certiport_Console ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Console ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "%ProgramFiles(x86)%\Certiport\Certiport Update Service\CertiportNow.exe" (ECHO %ComputerName% ; Certiport ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSCERTIPORT
"%PATH_PROGRAMS%\Console.exe" /Silent Path="C:\Certiport\Console" && ECHO %ComputerName% ; Certiport_Console ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "C:\Certiport\Console\CertiportConsole.exe" (ECHO %ComputerName% ; Certiport_Console ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Console ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

DEL /F /Q "C:\Certiport\Console\Console*.bat" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
DEL /F /Q "C:\Certiport\Console\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
DEL /F /Q "C:\Users\Public\Desktop\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\CertiportConsole*.*" "C:\Certiport\Console\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\CertiportConsole.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 

REM popd