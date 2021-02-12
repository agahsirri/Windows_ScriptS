set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\FOilSim
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCOPY /S /Y /I "%PATH_PROGRAMS%\FOilSim.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; FOilSim ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FOilSim ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd