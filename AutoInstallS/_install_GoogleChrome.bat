set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Google
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (
      GOTO :UNSCHROME
   ) ELSE (
      GOTO :INSCHROME
   )

:UNSCHROME
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\Chrome.msi" /qn /norestart && ECHO %ComputerName% ; Chrome ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (ECHO %ComputerName% ; Chrome ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Chrome ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   

:INSCHROME
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\Chrome.msi" /qn /norestart && ECHO %ComputerName% ; Chrome ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (ECHO %ComputerName% ; Chrome ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Chrome ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd