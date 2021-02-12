set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Scratch
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Scratch_Cameyo.exe" "%ProgramFiles(x86)%\Scratch\" && ECHO %ComputerName% ; Scratch ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Scratch ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Scratch.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Scratch ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Scratch ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd