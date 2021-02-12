set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\PuTTY
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\putty.exe" "%ProgramFiles%\PuTTY\" && ECHO %ComputerName% ; putty ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; putty ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\putty.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; putty ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; putty ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd