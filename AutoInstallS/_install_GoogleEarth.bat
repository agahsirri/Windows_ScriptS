set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Google
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i /s "%PATH_PROGRAMS%\Google Earth Pro" "%ProgramFiles%\Google\Google Earth Pro\" && ECHO %ComputerName% ; GoogleEarth ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; GoogleEarth ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%ProgramFiles%\Google\Google Earth Pro\client\Google Earth.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; GoogleEarth ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; GoogleEarth ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd