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

set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Java
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set Parameter1=
set Parameter2=l
set PATH_PROCESS1="%ProgramFiles%\Java"
set PATH_PROCESS2="%ProgramFiles(x86)%\Java"

IF "%~1"=="u" Set Parameter1=exit /b 1

FOR /r "%ProgramFiles(x86)%\Java\" %%G IN (java*.exe) DO (IF EXIST %%~G SET Parameter2="%%G")
IF [%Parameter2%] EQU [] (GOTO :INSTALL) ELSE (GOTO :UNINSTALL)

:UNINSTALL
taskkill /IM "jucheck.exe" /F
taskkill /IM "jusched.exe" /F
wmic /node:"%ComputerName%" product where "Name like 'Java 8%%'" call uninstall & (ECHO %ComputerName% ; JavaJRE ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
wmic product get name | findstr /i /C:"Java 8" & (IF ERRORLEVEL 1 (ECHO %ComputerName% ; JavaJRE ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; JavaJRE ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"))
%Parameter1%
COLOR 07

:INSTALL
"%PATH_PROGRAMS%\JavaJRE.exe" /s && ECHO %ComputerName% ; JavaJRE ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
wmic product get name | findstr /i /C:"Java 8" & (IF NOT ERRORLEVEL 1 (ECHO %ComputerName% ; JavaJRE ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; JavaJRE ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"))
%Parameter1% 
COLOR 07
