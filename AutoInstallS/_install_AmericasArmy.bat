set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\AmericasArmy
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\America's Army Education\system\ArmyOps.exe" (
      GOTO :UNSAMEARMY
   ) ELSE (
      GOTO :INSAMEARMY
   )

:UNSAMEARMY
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\AmericasArmy.msi" /qn && ECHO %ComputerName% ; AmericasArmy ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\America's Army Education\system\ArmyOps.exe" (ECHO %ComputerName% ; AmericasArmy ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AmericasArmy ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSAMEARMY
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\AmericasArmy.msi" /qn && ECHO %ComputerName% ; AmericasArmy ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\America's Army Education\system\ArmyOps.exe" XCOPY /Y "\\172.2.5.1\software\ProgramS\AmericasArmy\*student.lnk" "%SystemDrive%\Users\Public\Desktop" && (ECHO %ComputerName% ; AmericasArmy ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; AmericasArmy ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd