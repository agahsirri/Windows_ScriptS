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

set PATH_PROGRAMS="LaunchNotebook.exe"
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS1="%ProgramFiles(x86)%\SMART Technologies\Education Software"
set PATH_PROCESS2="%ProgramFiles%\SMART Technologies\Education Software"

((dir /s %PATH_PROCESS1% | find %PATH_PROGRAMS%) || (dir /s %PATH_PROCESS2% | find %PATH_PROGRAMS%)) && ECHO %ComputerName% ; %PATH_PROGRAMS% ; exist ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; %PATH_PROGRAMS% ; exist ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM ((dir /s "%ProgramFiles%\WindowsApps" | find "excel.exe") || (dir /s "%ProgramFiles%\Microsoft Office" | find "excel.exe")) && calc.exe || notepad.exe