set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Certiport\Compass
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

IF EXIST "C:\Certiport\Compass\" (
	DEL /F /Q "C:\Certiport\Console\Console*.bat" && ECHO %ComputerName% ; Certiport_Compass ; DEL_old_bat ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Compass ; DEL_old_bat ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	DEL /F /Q "C:\Certiport\Console\Console*.lnk" && ECHO %ComputerName% ; Certiport_Compass ; DEL_old_lnk_dir ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Compass ; DEL_old_lnk_dir ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	DEL /F /Q "C:\Users\Public\Desktop\Compass*.lnk" && ECHO %ComputerName% ; Certiport_Compass ; DEL_old_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Compass ; DEL_old_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	COPY /Y "%PATH_PROGRAMS%\CompassPreLoader_new*.*" "C:\Certiport\Compass\" && ECHO %ComputerName% ; Certiport_Compass ; ADD_new_EXEs ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Compass ; ADD_new_EXEs ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
	COPY /Y "%PATH_PROGRAMS%\Compass.lnk" "C:\Users\Public\Desktop" && ECHO %ComputerName% ; Certiport_Compass ; ADD_new_lnk_dtop ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Certiport_Compass ; ADD_new_lnk_dtop ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
) ELSE (
	ECHO %ComputerName% ; Certiport_Compass ; SoftwareExist ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" 
)