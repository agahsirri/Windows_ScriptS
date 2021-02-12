set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\RDWorks
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "C:\RDWorksV8\" (
      GOTO :UNSRDWORKS
   ) ELSE (
      GOTO :INSRDWORKS
   )

:UNSRDWORKS
"C:\RDWorksV8\RDWorksV8Uninstall.exe" /S && ECHO %ComputerName% ; RDWorks ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
RMDir /S /Q "C:\RDWorksV8" && ECHO %ComputerName% ; RDWorks ; uninstall ; CONTINUE ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "C:\RDWorksV8" (ECHO %ComputerName% ; RDWorks ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; RDWorks ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSRDWORKS
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\RDWorksV8*.*" "C:\RDWorksV8\" && ECHO %ComputerName% ; RDWorks ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; RDWorks ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\RDWorksV8.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; RDWorks ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; RDWorks ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd