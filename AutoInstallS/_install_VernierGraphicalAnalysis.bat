set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Vernier\GraphicalAnalysis
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Vernier Graphical Analysis.Cameyo.exe" "%ProgramFiles(x86)%\Vernier Graphical Analysis\" && ECHO %ComputerName% ; VernierGraphicalAnalysis ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VernierGraphicalAnalysis ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\Vernier Graphical Analysis.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; VernierGraphicalAnalysis ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VernierGraphicalAnalysis ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd