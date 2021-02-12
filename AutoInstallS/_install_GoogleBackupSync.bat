set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Google
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Google\GoogleBackupSync.exe" (
      GOTO :UNSGBCKSYN
   ) ELSE (
      GOTO :INSGBCKSYN
   )

:UNSGBCKSYN
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\GoogleBackupSync.msi" /n && ECHO %ComputerName% ; GoogleBackupSync ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Google\GoogleBackupSync.exe" (ECHO %ComputerName% ; GoogleBackupSync ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; GoogleBackupSync ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   

:INSGBCKSYN
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\GoogleBackupSync.msi" /n && ECHO %ComputerName% ; GoogleBackupSync ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Google\GoogleBackupSync.exe" (ECHO %ComputerName% ; GoogleBackupSync ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; GoogleBackupSync ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd