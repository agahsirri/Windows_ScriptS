set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\NetBeans
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\NetBeans 8.0.2\bin\netbeans64.exe" (
      GOTO :UNSSKETCHPAD
   ) ELSE (
      GOTO :INSSKETCHPAD
   )

:UNSSKETCHPAD
REM "%ProgramFiles%\NetBeans 8.0.2\uninstall.exe" --silent && ECHO %ComputerName% ; NetBeans ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles%\NetBeans 8.0.2\bin\netbeans64.exe" (ECHO %ComputerName% ; NetBeans ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; NetBeans ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSSKETCHPAD
"%PATH_PROGRAMS%\NetBeans.exe" --silent && ECHO %ComputerName% ; NetBeans ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\NetBeans 8.0.2\bin\netbeans64.exe" (ECHO %ComputerName% ; NetBeans ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; NetBeans ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd
REM License Name: Orlando Science Schools
REM Authorization Code: MPFJAC-1Q3N5H-W19X2F-1HUW6J