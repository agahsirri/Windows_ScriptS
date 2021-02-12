set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Intelitek\RoboCell
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Intelitek_RoboCell.Cameyo.exe" "%ProgramFiles(x86)%\Intelitek\" && ECHO %ComputerName% ; Intelitek_RoboCell ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Intelitek_RoboCell ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Intelitek RoboCell.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Intelitek_RoboCell ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Intelitek_RoboCell ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd