set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\PyCharm
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (
      GOTO :UNSPYCHARM
   ) ELSE (
      GOTO :INSPYCHARM
   )

:UNSPYCHARM
"%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\Uninstall.exe" /S && ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; PyCharmCommunity ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSPYCHARM
"%PATH_PROGRAMS%\PyCharmCommunity.exe" /S && ECHO %ComputerName% ; PyCharmCommunity ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; PyCharmCommunity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\JetBrains\PyCharm Community Edition 2018.2.2\bin\pycharm64.exe" (ECHO %ComputerName% ; PyCharmCommunity ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; PyCharmCommunity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
XCopy /y /c /h /r /i "%PATH_PROGRAMS%\pycharm64.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; PyCharm ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; PyCharm ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM popd