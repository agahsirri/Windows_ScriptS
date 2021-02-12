set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Kompozer
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i /e /q "%PATH_PROGRAMS%\*" "%ProgramFiles(x86)%\Kompozer\" && ECHO %ComputerName% ; Kompozer ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Kompozer ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Kompozer.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Kompozer ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Kompozer ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd