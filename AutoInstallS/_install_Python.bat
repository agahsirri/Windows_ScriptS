set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Python
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Python39\python.exe" (
      GOTO :UNSPYTHON
   ) ELSE (
      GOTO :INSPYTHON
   )

:UNSPYTHON
wmic product where "name like '%%python%%'" call uninstall
IF NOT EXIST "%ProgramFiles%\Python39\python.exe" (ECHO %ComputerName% ; Python ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Python ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSPYTHON
"%PATH_PROGRAMS%\Python.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0 && ECHO %ComputerName% ; Python ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Python ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Python39\python.exe" (ECHO %ComputerName% ; Python ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Python ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd