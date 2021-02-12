set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Certiport
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "C:\Certiport\Console\CertiportConsole.exe" (
      GOTO :UNSCERTIPORT
   ) ELSE (
      GOTO :INSCERTIPORT
   )

:UNSCERTIPORT
"C:\Certiport\Compass\Uninstaller.exe" /S && ECHO %ComputerName% ; Certiport_Compass ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"C:\Certiport\Console\Uninstall.exe" /S && ECHO %ComputerName% ; Certiport_Console ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%ProgramFiles(x86)%\Certiport\Certiport Update Service\uninstall.exe" /S && ECHO %ComputerName% ; Certiport ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "C:\Certiport\Compass\AppLauncher.exe" (ECHO %ComputerName% ; Certiport_Compass ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Compass ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "C:\Certiport\Console\CertiportConsole.exe" (ECHO %ComputerName% ; Certiport_Console ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Console ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "%ProgramFiles(x86)%\Certiport\Certiport Update Service\CertiportNow.exe" (ECHO %ComputerName% ; Certiport ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSCERTIPORT
"%PATH_PROGRAMS%\Console.exe" /Silent Path="C:\Certiport\Console" && ECHO %ComputerName% ; Certiport_Console ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "C:\Certiport\Console\CertiportConsole.exe" (ECHO %ComputerName% ; Certiport_Console ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Certiport_Console ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

DEL /F /Q "C:\Certiport\Console\Console*.bat" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
DEL /F /Q "C:\Certiport\Console\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
DEL /F /Q "C:\Users\Public\Desktop\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\CertiportConsole*.*" "C:\Certiport\Console\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
COPY /Y "%PATH_PROGRAMS%\CertiportConsole.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 

REM popd