set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Microsoft\MSOffice365
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (
      GOTO :UNSMSOFFIC
   ) ELSE (
      GOTO :INSMSOFFIC
   )

:UNSMSOFFIC
%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\AnyConnect.msi" /norestart /passive && ECHO %ComputerName% ; AnyConnect ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (ECHO %ComputerName% ; AnyConnect ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AnyConnect ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSMSOFFIC
IF NOT EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" ("%PATH_PROGRAMS%\O365ProPlus.exe" /configure "%PATH_PROGRAMS%\O365ProPlus.xml") ELSE (ECHO %ComputerName% ; MSOffice ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" (ECHO %ComputerName% ; MSOffice ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MSOffice ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd