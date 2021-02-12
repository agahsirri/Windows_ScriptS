set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\AdobeCS4\_UnattendedInstallerS\AdobeCS4_Fireworks
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramFiles%\Adobe\Adobe Fireworks CS4 (64 Bit)\Fireworks.exe" "%PATH_PROGRAMS%\AdobeUberInstaller.exe" && ECHO %ComputerName% ; AdobeCS4_Fireworks ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Adobe\Adobe Fireworks CS4 (64 Bit)\Fireworks.exe" (ECHO %ComputerName% ; AdobeCS4_Fireworks ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AdobeCS4_Fireworks ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd