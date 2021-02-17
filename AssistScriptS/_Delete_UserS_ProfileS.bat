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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.2.4\Software\ProgramS\_ScriptS

REM @echo off
if not "%~1" == "" goto DeleteFolder
REM %SystemRoot%\System32\forfiles.exe /P "C:\Users" /D -1 /C "%SystemRoot%\System32\cmd.exe /C if @isdir == TRUE "%~f0" @path"
%SystemRoot%\System32\forfiles.exe /P "C:\Users" /D -1 /C "%SystemRoot%\System32\cmd.exe /C if @isdir == TRUE "%PATH_PROCESS%\%~n0%~x0" @path"
goto :EOF

:DeleteFolder
for %%I in ("All Users" "Default User" "Default" "Public" "install" "install.OSS" "Agah.Sarioglu" "Agah.Sarioglu.OSS" "ikeles" "ikeles.OSS") do if /I "%~nx1" == "%%~I" goto :EOF
rd /Q /S %1 && ECHO %ComputerName% ; %1 ; UserProfileS_Deleted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; %1 ; UserProfileS_Deleted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"