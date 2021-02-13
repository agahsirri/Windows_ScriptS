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

set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\VirtualBox
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (
      GOTO :UNSVIRTBOX
   ) ELSE (
      GOTO :INSVIRTBOX
   )

:UNSVIRTBOX
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\VirtualBox_x64.msi" /norestart /passive && ECHO %ComputerName% ; VirtualBox ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (ECHO %ComputerName% ; VirtualBox ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VirtualBox ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSVIRTBOX
"%WinDir%\System32\certutil.exe" -addstore -f "TrustedPublisher" "%PATH_PROCESS%\_install_VirtualBox.cer" && ECHO %ComputerName% ; VirtualBox ; certificate1 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; certificate1 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\VirtualBox_x64.msi" /norestart /passive && ECHO %ComputerName% ; VirtualBox ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
DEL /F /Q "C:\Users\Public\Desktop\*VirtualBox*.lnk" && ECHO %ComputerName% ; VirtualBox ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\VirtualBox_run*.*" "%ProgramFiles%\Oracle\VirtualBox\" && ECHO %ComputerName% ; VirtualBox ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\VirtualBox.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; VirtualBox ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
IF EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (ECHO %ComputerName% ; VirtualBox ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VirtualBox ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd