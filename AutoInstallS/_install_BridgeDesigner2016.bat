set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\WestPointBridge
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Bridge Designer 2016 (2nd Edition)\bdv16j243.exe" (
      GOTO :UNSBRIDGDS
   ) ELSE (
      GOTO :INSBRIDGDS
   )

:UNSBRIDGDS
"%ProgramFiles(x86)%\Bridge Designer 2016 (2nd Edition)\uninstall.exe" /S && ECHO %ComputerName% ; BridgeDesigner2016 ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Bridge Designer 2016 (2nd Edition)\bdv16j243.exe" (ECHO %ComputerName% ; BridgeDesigner2016 ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; BridgeDesigner2016 ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSBRIDGDS
"%PATH_PROGRAMS%\WestPointBridge2016.exe" /S && ECHO %ComputerName% ; BridgeDesigner2016 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Bridge Designer 2016 (2nd Edition)\bdv16j243.exe" (ECHO %ComputerName% ; BridgeDesigner2016 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; BridgeDesigner2016 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd