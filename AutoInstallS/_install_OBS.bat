set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\OBS
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF EXIST "%ProgramFiles%\obs-studio\bin\64bit\obs64.exe" (
      GOTO :UNSOBS
   ) ELSE (
      GOTO :INSOBS
   )

:UNSOBS
wmic /node:"." product where "Name like '%OBS%'" call uninstall && ECHO %ComputerName% ; OBS ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; OBS ; uninstall ; FAILED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\obs-studio\bin\64bit\obs64.exe" (ECHO %ComputerName% ; OBS ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; OBS ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   

:INSOBS
"%PATH_PROGRAMS%\OBS.exe" /S && ECHO %ComputerName% ; OBS ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\obs-studio\bin\64bit\obs64.exe" (ECHO %ComputerName% ; OBS ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; OBS ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd