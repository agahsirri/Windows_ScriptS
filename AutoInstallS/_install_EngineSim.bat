set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\EngineSim
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCOPY /S /Y /I "%PATH_PROGRAMS%\EngineSim.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; EngineSim ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; EngineSim ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd