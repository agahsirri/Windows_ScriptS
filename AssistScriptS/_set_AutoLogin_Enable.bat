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

@ECHO OFF
CLS
set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\_ScriptS
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

SET /P DOMAIN="Please enter the DOMAIN_NAME for the user who will (auto) login to the computer: "
SET /P USRNAME="Please enter a USER_NAME who will (auto) login on the computer: "

	:HInput
	@Echo Off  
	SetLocal DisableDelayedExpansion
	Echo Please enter password of %USRNAME% :
	Set "PASSW="
	For /F %%# In ('"Prompt;$H&For %%# in (1) Do Rem"') Do Set "BS=%%#"

	:HILoop
	Set "Key="
	For /F "delims=" %%# In ('Xcopy /W "%~f0" "%~f0" 2^>Nul') Do If Not Defined Key Set "Key=%%#"
	Set "Key=%Key:~-1%"
	SetLocal EnableDelayedExpansion
	If Not Defined Key Goto :HIEnd
	If %BS%==^%Key% (
		Set /P "=%BS% %BS%" <Nul
		Set "Key="
		If Defined PASSW Set "PASSW=!PASSW:~0,-1!"
		) Else Set /P "=*" <Nul
	If Not Defined PASSW (EndLocal &Set "PASSW=%Key%") Else For /F delims^=^ eol^= %%# In ("!PASSW!") Do EndLocal &Set "PASSW=%%#%Key%"
	Goto :HILoop
	:HIEnd

ECHO
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "DefaultDomainName" /d "%DOMAIN%" && ECHO %ComputerName% ; Registery_Key_Add ; DefaultDomainName ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Add ; DefaultDomainName ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "DefaultUserName" /d "%USRNAME%" && ECHO %ComputerName% ; Registery_Key_Add ; DefaultUserName ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Add ; DefaultUserName ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "DefaultPassword" /d "!PASSW!" && ECHO %ComputerName% ; Registery_Key_Add ; DefaultPassword ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Add ; DefaultPassword ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /f /t REG_SZ /v "AutoAdminLogon" /d "1" && ECHO %ComputerName% ; Registery_Key_Add ; AutoAdminLogon ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Add ; AutoAdminLogon ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%SystemRoot%\System32\reg.exe" ADD "\\%ComputerName%\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /f /t REG_DWORD /v "NoLockScreen" /d "1" && ECHO %ComputerName% ; Registery_Key_Add ; NoLockScreen ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Registery_Key_Add ; NoLockScreen ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
