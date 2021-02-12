set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Apple\iTunes
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM IF NOT EXIST "%WINDIR%\%~nx0" (GOTO :PROCESSSTART) ELSE (del /q /f "%WINDIR%\%~nx0")

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\iTunes\iTunes.exe" (
      GOTO :UNSITUNES
   ) ELSE (
      GOTO :INSITUNES
   )

:UNSITUNES
REM "%ProgramFiles%\Apple\iTunes\uninstall\helper.exe" -ms && ECHO %ComputerName% ; iTunes ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles%\iTunes\iTunesHelper.exe" (ECHO %ComputerName% ; iTunes ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; iTunes ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   
:INSITUNES
REM Install software updater -- OPTIONAL - remove command if not required
REM START /wait msiexec /i "%~dp0AppleSoftwareUpdate.msi" /qn /norestart
IF DEFINED ProgramFiles(x86) START /wait msiexec /i "%PATH_PROGRAMS%\AppleApplicationSupport64.msi" /qn /norestart
IF DEFINED ProgramFiles(x86) START /wait msiexec /i "%PATH_PROGRAMS%\AppleMobileDeviceSupport64.msi" /qn /norestart
IF DEFINED ProgramFiles(x86) START /wait msiexec /i "%PATH_PROGRAMS%\iTunes64.mi" /qn /norestart && ECHO %ComputerName% ; iTunes ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\iTunes\iTunes.exe" (ECHO %ComputerName% ; iTunes ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; iTunes ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")