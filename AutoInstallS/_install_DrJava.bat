set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\DRJava
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\DrJava.exe" "%ProgramFiles(x86)%\DrJava\" && ECHO %ComputerName% ; DrJava ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; DrJava ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\DrJava.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; DrJava ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; DrJava ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd