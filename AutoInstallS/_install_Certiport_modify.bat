set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\Certiport
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

IF EXIST "C:\Certiport\Console\" (
	DEL /F /Q "C:\Certiport\Console\Console*.bat" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_bat ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	DEL /F /Q "C:\Certiport\Console\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dir ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	DEL /F /Q "C:\Users\Public\Desktop\Console*.lnk" && ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	COPY /Y "%PATH_PROGRAMS%\CertiportConsole*.*" "C:\Certiport\Console\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	COPY /Y "%PATH_PROGRAMS%\CertiportConsole.lnk" "C:\Users\Public\Desktop\" && ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Console ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
) ELSE (
	ECHO %ComputerName% ; Certiport_Console ; SoftwareExist ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
)