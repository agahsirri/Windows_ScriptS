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

REM TAKEOWN /F "C:\ProgramData\Microsoft\Windows\SystemData" /A /R /D Y
REM FOR /F "TOKENS=*" %%F IN ('DIR /B /AD "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen*"') DO SET ImgDirName=%%~F
REM FOR /F "TOKENS=*" %%F IN ('DIR /B "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\%ImgDirName%\*"') DO SET ImgFileName=%%~F
MOVE "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\LockScreen_V" "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\_tmp\"

REM ICACLS "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\%ImgDirName%\%ImgFileName%" /INHERITANCE:e /GRANT:r "Administrators":(M) /T /C

REM copy /y "\\172.2.5.1\Software\ProgramS\_ConfigS\ImageS\OrlandoScienceSchools01.jpg" "C:\ProgramData\Microsoft\Windows\SystemData\S-1-5-18\ReadOnly\%ImgDirName%\%ImgFileName%"

REG ADD "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "\\172.2.5.1\Software\ProgramS\_ConfigS\ImageS\Background_NYC_01.jpg" /f
REM REG ADD "HKLM\Software\Microsoft\windows\CurrentVersion\Policies\System" /v Wallpaper /t REG_SZ /d "\\172.2.5.1\Software\ProgramS\_ConfigS\ImageS\Background_NYC_01.jpg" /f
REM REG ADD "HKLM\Software\Microsoft\windows\CurrentVersion\Policies\System" /v WallpaperStyle /t REG_SZ /d 2 /f
REG ADD "HKLM\Software\Microsoft\windows\CurrentVersion\Policies\ActiveDesktop" /v NoChangingWallPaper /reg:32 /t REG_DWORD /d 1 /f
REG ADD "HKLM\Software\Policies\Microsoft\windows\System" /v DisableLogonBackgroundImage /reg:32 /t REG_DWORD /d 1 /f
REG ADD "HKLM\Software\Policies\Microsoft\windows\Personalization" /v NoChangingLockScreen /reg:32 /t REG_DWORD /d 1 /f
REG ADD "HKLM\Software\Policies\Microsoft\windows\Personalization" /v LockScreenImage /t REG_SZ /d "\\172.2.5.1\Software\ProgramS\_ConfigS\ImageS\Background_NYC_01.jpg" /f
