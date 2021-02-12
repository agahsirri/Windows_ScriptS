set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\MDSolids
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\MDSolids40\MDSolids.exe" (
      GOTO :UNSMDSOLID
   ) ELSE (
      GOTO :INSMDSOLID
   )

:UNSMDSOLID
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\MDSolids40.msi" /qn /norestart && ECHO %ComputerName% ; MDSolids ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\MDSolids40\MDSolids.exe" (ECHO %ComputerName% ; MDSolids ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MDSolids ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSMDSOLID
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\MDSolids40.msi" /qn /norestart && ECHO %ComputerName% ; MDSolids ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\MDSolids40\MDSolids.exe" (ECHO %ComputerName% ; MDSolids ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; MDSolids ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd