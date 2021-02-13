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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\X-Plane
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*" "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\" && ECHO %ComputerName% ; X-Plane ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Attrib -r "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn" && ECHO %ComputerName% ; X-Plane ; Unchecked_R/O ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Unchecked_R/O ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" "%WinDir%\Explorer.exe" "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" Powershell -Command Mount-DiskImage -ImagePath "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" Powershell -Command DisMount-DiskImage -ImagePath "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_UnMounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_UnMounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
NETSH firewall add allowedprogram "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\X-Plane.exe" XPlane ENABLE  && ECHO %ComputerName% ; X-Plane ; Firewall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Firewall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; X-Plane ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd