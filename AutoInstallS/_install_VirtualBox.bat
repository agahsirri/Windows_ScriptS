set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\VirtualBox
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (
      GOTO :UNSVIRTBOX
   ) ELSE (
      GOTO :INSVIRTBOX
   )

:UNSVIRTBOX
"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\VirtualBox_x64.msi" /norestart /passive && ECHO %ComputerName% ; VirtualBox ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (ECHO %ComputerName% ; VirtualBox ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VirtualBox ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSVIRTBOX
"%WinDir%\System32\certutil.exe" -addstore -f "TrustedPublisher" "%PATH_PROCESS%\_install_VirtualBox.cer" && ECHO %ComputerName% ; VirtualBox ; certificate1 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; certificate1 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\VirtualBox_x64.msi" /norestart /passive && ECHO %ComputerName% ; VirtualBox ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
DEL /F /Q "C:\Users\Public\Desktop\*VirtualBox*.lnk" && ECHO %ComputerName% ; VirtualBox ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\VirtualBox_run*.*" "%ProgramFiles%\Oracle\VirtualBox\" && ECHO %ComputerName% ; VirtualBox ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\VirtualBox.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; VirtualBox ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VirtualBox ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
IF EXIST "%ProgramFiles%\Oracle\VirtualBox\VirtualBox.exe" (ECHO %ComputerName% ; VirtualBox ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VirtualBox ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd