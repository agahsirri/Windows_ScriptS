set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Cisco
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe" (
      GOTO :UNSANYCONN
   ) ELSE (
      GOTO :INSANYCONN
   )

:UNSANYCONN
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\AnyConnect.msi" /norestart /passive && ECHO %ComputerName% ; AnyConnect ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe" (ECHO %ComputerName% ; AnyConnect ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AnyConnect ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSANYCONN
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\AnyConnect.msi" /norestart /passive && ECHO %ComputerName% ; AnyConnect ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
SC QUERYEX "vpnagent" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; AnyConnect ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; AnyConnect ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd