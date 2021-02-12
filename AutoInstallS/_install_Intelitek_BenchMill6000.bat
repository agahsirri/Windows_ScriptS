set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Intelitek\BenchMill6000
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Intelitek_CNCMotion_BenchMill6000.Cameyo.exe" "%ProgramFiles(x86)%\Intelitek\" && ECHO %ComputerName% ; Intelitek_BenchMill6000 ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Intelitek_BenchMill6000 ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Intelitek_CNCMotion_BenchMill6000.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Intelitek_BenchMill6000 ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Intelitek_BenchMill6000 ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd