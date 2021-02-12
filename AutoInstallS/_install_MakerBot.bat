set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\MakerBot
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\MakerBot\MakerWare\makerware.exe" (
      GOTO :UNSMAKERBOT
   ) ELSE (
      GOTO :INSMAKERBOT
   )

:UNSMAKERBOT
"%ProgramFiles%\MakerBot\Uninstall.exe" /S && ECHO %ComputerName% ; MakerBot ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM wmic /node:"%ComputerName%" product where "Name like '%MakerBot%'" call uninstall && ECHO %ComputerName% ; MakerBot ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\MakerBot\MakerWare\makerware.exe" (ECHO %ComputerName% ; MakerBot ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MakerBot ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSMAKERBOT
"%WinDir%\System32\certutil.exe" /addstore /f "TrustedPublisher" "%PATH_PROCESS%\_install_MakerBot.cer" && ECHO %ComputerName% ; MakerBot ; certificate ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; MakerBot ; certificate ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\MakerBot.exe" /S && ECHO %ComputerName% ; MakerBot ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\MakerBot\MakerWare\makerware.exe" (ECHO %ComputerName% ; MakerBot ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MakerBot ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd