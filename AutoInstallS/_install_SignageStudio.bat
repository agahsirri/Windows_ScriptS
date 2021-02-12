set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\SignageStudio
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\SignageStudio\SignageStudio.exe" (
      GOTO :UNSIGNAGES
   ) ELSE (
      GOTO :INSIGNAGES
   )

:UNSIGNAGES
REM "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\Chrome.msi" /qn /norestart && ECHO %ComputerName% ; Chrome ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" (ECHO %ComputerName% ; Chrome ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Chrome ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   

:INSIGNAGES
"%PATH_PROGRAMS%\SignageStudio.exe" /S && ECHO %ComputerName% ; SignageStudio ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\SignageStudio\SignageStudio.exe" (ECHO %ComputerName% ; SignageStudio ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; SignageStudio ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd