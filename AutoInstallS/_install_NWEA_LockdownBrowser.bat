set PATH_PROGRAMS=\\172.2.5.1\software\ProgramS\NWEA_LockdownBrowser
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (
      GOTO :UNSLOCKDOWN
   ) ELSE (
      GOTO :INSLOCKDOWN
   )

:UNSLOCKDOWN
IF EXIST "%ProgramFiles(x86)%\NWEA\Lockdown Browser\Lockdown Browser.exe" wmic product where name="Lockdown Browser" call uninstall
IF NOT EXIST "%ProgramFiles(x86)%\NWEA\Lockdown Browser\Lockdown Browser.exe" (ECHO %ComputerName% ; LockdownBrowser1 ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser1 ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" wmic product where name="Lockdown Browser" call uninstall
IF NOT EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (ECHO %ComputerName% ; LockdownBrowser2 ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser2 ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSLOCKDOWN
"%PATH_PROGRAMS%\LockdownBrowser.exe" /S /v/qn && ECHO %ComputerName% ; LockdownBrowser ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\NWEA\NWEA Secure Testing Browser\NWEA Secure Testing Browser.exe" (ECHO %ComputerName% ; LockdownBrowser ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; LockdownBrowser ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd