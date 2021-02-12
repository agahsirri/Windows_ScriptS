set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Aery
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF NOT EXIST "%ProgramFiles(x86)%\Aery" (
   XCOPY /S /I /Y "%PATH_PROGRAMS%\*" "%ProgramFiles(x86)%\Aery\" && ECHO %ComputerName% ; Aery ; Copied ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Aery ; Copied ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
   "%WinDir%\System32\regsvr32.exe" /s "%ProgramFiles(x86)%\Aery\VSOCX32.OCX" && ECHO %ComputerName% ; Aery ; OCX_Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Aery ; OCX_Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
   XCOPY /S /I /Y "%PATH_PROGRAMS%\Aery.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; Aery ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Aery ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
)

REM popd