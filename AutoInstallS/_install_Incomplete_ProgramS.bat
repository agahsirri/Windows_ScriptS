set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Atom
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\AtomSetup.exe" "%ProgramData%\Atom\" && ECHO %ComputerName% ; Atom ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Atom ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\AtomSetup.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Atom ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Atom ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
