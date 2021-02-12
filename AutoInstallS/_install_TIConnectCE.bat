set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\TIConnectCE
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\TI Education\TI Connect CE\TI Connect CE.exe" (
      GOTO :UNSTICONNECT
   ) ELSE (
      GOTO :INSTICONNECT
   )

:UNSTICONNECT
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\TIConnectCE.msi" /norestart /passive && ECHO %ComputerName% ; TIConnectCE ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\TI Education\TI Connect CE\TI Connect CE.exe" (ECHO %ComputerName% ; TIConnectCE ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TIConnectCE ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSTICONNECT
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TIConnectCE.msi" /norestart /passive && ECHO %ComputerName% ; TIConnectCE ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\TI Education\TI Connect CE\TI Connect CE.exe" (ECHO %ComputerName% ; TIConnectCE ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TIConnectCE ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd