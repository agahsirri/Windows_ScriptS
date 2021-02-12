set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\VirtualTensileTester
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramData%\VirtualTensileTester\VirtualTensileTester.swf" XCOPY /S /I /Y "%PATH_PROGRAMS%\VirtualTensileTester.swf" "%ProgramData%\VirtualTensileTester\" && ECHO %ComputerName% ; VirtualTensileTester ; copied ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualTensileTester ; copied ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramData%\VirtualTensileTester\VirtualTensileTester.swf" XCOPY /S /I /Y "%PATH_PROGRAMS%\VirtualTensileTester.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; VirtualTensileTester ; shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualTensileTester ; shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd