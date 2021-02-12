set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\OpenRocket
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\OpenRocket.jar" "%ProgramData%\OpenRocket\" && ECHO %ComputerName% ; OpenRocket ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; OpenRocket ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\OpenRocket.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; OpenRocket ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; OpenRocket ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd