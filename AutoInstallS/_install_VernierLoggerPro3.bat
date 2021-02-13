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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Vernier\LoggerPro3
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\LoggerPro\LoggerPro.exe" (
      GOTO :UNSLOGGRPRO
   ) ELSE (
      GOTO :INSLOGGRPRO
   )

:UNSLOGGRPRO
"%PATH_PROGRAMS%\LP383_and_earlier_Uninstall.exe" /s /Z"SILENT" && ECHO %ComputerName% ; LoggerPro ; uninstall1 ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\LP383_and_earlier_Uninstall.exe" /s /uninst && ECHO %ComputerName% ; LoggerPro ; uninstall2 ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /qn /x{C6586FE3-7DBE-4F71-BA8A-A4998F6F0A96} && ECHO %ComputerName% ; LoggerPro ; uninstall3 ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\LoggerPro\LoggerPro.exe" (ECHO %ComputerName% ; LoggerPro ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LoggerPro ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSLOGGRPRO
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j

if "%version%" == "6.1" (
REM Install the 2013 MSVC redistributable for Windows 7
echo "Installing 2013 MSVC redistributable for Windows 7!"
vcredist_x86.exe /q
)
if "%version%" == "6.2" (
REM Install the 2013 MSVC redistributable for Windows 7
echo "Installing 2013 MSVC redistributable for Windows 8!"
vcredist_x86.exe /q
)
if "%version%" == "6.3" (
REM Install the 2013 MSVC redistributable for Windows 7
echo "Installing 2013 MSVC redistributable for Windows 8.1!"
vcredist_x86.exe /q
)
if "%version%" == "10.0" (
REM Install the 2015 MSVC redistributable for BLE (Win10 only)
echo "Installing 2015 MSVC redistributable for Windows 10!"
vc_redist.x86.exe /q
)
echo %version%
endlocal

REM This is the silent installer for Vernier Logger Pro software
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\Logger Pro 3.msi" /qn /L*v %TEMP%\LoggerPro3_msilog.txt && ECHO %ComputerName% ; VernierLoggerPro3 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Vernier Software\Logger Pro 3\LoggerPro.exe" (ECHO %ComputerName% ; VernierLoggerPro3 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VernierLoggerPro3 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM This is the silent installer for Vernier Logger Pro software including the DataShare install
REM msiexec /i "Logger Pro 3.msi" INSTALLDATASHARE="INSTALL" /qn /L*v %TEMP%\LoggerPro3_msilog.txt

REM popd
