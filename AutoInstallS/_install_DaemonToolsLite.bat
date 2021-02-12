set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\DaemonToolsLite
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

:PROCESSSTART
"%WinDir%\System32\certutil.exe" -addstore -f "TrustedPublisher" "%PATH_PROCESS%\_install_DaemonToolsLite.cer" && ECHO %ComputerName% ; DaemonToolsLite ; certificate1 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; DaemonToolsLite ; certificate1 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\DAEMON Tools Lite\DTLite.exe" "%PATH_PROGRAMS%\DaemonToolsLite.exe" /S /nogadget /sptd && ECHO %ComputerName% ; DaemonToolsLite ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\DAEMON Tools Lite\DTLite.exe" (ECHO %ComputerName% ; DaemonToolsLite ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; DaemonToolsLite ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd