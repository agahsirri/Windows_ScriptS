set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\GitS
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\TortoiseGit\bin\TortoiseGitProc.exe" (
      GOTO :UNSGITTORT
   ) ELSE (
      GOTO :INSGITTORT
   )

:UNSGITTORT
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\TortoiseGit.msi" /norestart /passive && ECHO %ComputerName% ; TortoiseGit ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\TortoiseGit\bin\TortoiseGitProc.exe" (ECHO %ComputerName% ; TortoiseGit ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TortoiseGit ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSGITTORT
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TortoiseGit.msi" /norestart /passive && ECHO %ComputerName% ; TortoiseGit ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\TortoiseGit\bin\TortoiseGitProc.exe" (ECHO %ComputerName% ; TortoiseGit ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TortoiseGit ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd