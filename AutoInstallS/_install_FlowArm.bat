set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\FlowArm
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i /s "%PATH_PROGRAMS%\*" "%ProgramFiles(x86)%\FlowArm\" && ECHO %ComputerName% ; FlowArm ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FlowArm ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\FlowArm PLTW.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; FlowArm ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FlowArm ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd