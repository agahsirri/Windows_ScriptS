set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\RobotC
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

:PROCESSSTART
"%WinDir%\System32\certutil.exe" -addstore -f "TrustedPublisher" "%PATH_PROCESS%\_install_RobotC_1.cer" && ECHO %ComputerName% ; RobotC ; certificate1 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; RobotC ; certificate1 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\certutil.exe" -addstore -f "TrustedPublisher" "%PATH_PROCESS%\_install_RobotC_2.cer" && ECHO %ComputerName% ; RobotC ; certificate2 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; RobotC ; certificate2 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Robomatter Inc\ROBOTC Development Environment 4.X\RobotC.exe" "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\RobotC_VEX.msi" /norestart /passive && ECHO %ComputerName% ; RobotC ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Robomatter Inc\ROBOTC Development Environment 4.X\RobotC.exe" (ECHO %ComputerName% ; RobotC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; RobotC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd