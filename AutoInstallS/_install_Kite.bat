set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Kite
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\PLTW Kite Student Portal\kite.exe" (
      GOTO :UNSKITE
   ) ELSE (
      GOTO :INSKITE
   )

:UNSKITE
REM "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\Kite.msi" /qn /norestart && ECHO %ComputerName% ; Kite ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles(x86)%\Kite Student Portal\kite.exe" (ECHO %ComputerName% ; Kite ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Kite ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSKITE
"%PATH_PROGRAMS%\vc_redist.x86.exe" /q && ECHO %ComputerName% ; MS_C+_redist ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%Windir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\Kite.msi" /qn /norestart && ECHO %ComputerName% ; Kite ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\PLTW Kite Student Portal\kitestudentportal.exe" (ECHO %ComputerName% ; Kite ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Kite ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd