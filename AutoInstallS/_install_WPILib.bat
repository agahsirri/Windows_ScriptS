set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\WPILib
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%Public%\wpilib\2020\vscode\Code.exe" (
      GOTO :UNSWPILIB
   ) ELSE (
      GOTO :INSWPILIB
   )

:UNSWPILIB
RMDir /S /Q "%Public%\wpilib" && ECHO %ComputerName% ; WPILib ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Del /F /Q "%Public%\Desktop\FRC*.lnk" && ECHO %ComputerName% ; WPILib ; uninstall ; CONTINUE ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%Public%\wpilib" (ECHO %ComputerName% ; WPILib ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; WPILib ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSWPILIB
XCopy /y /c /h /r /i /e "%PATH_PROGRAMS%\wpilib" "%Public%\wpilib\" && ECHO %ComputerName% ; WPILib ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; WPILib ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\FRC*.lnk" "%Public%\Desktop\" && ECHO %ComputerName% ; WPILib ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; WPILib ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd