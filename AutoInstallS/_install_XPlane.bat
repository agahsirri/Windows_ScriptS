set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\X-Plane
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*" "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\" && ECHO %ComputerName% ; X-Plane ; Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Attrib -r "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn" && ECHO %ComputerName% ; X-Plane ; Unchecked_R/O ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Unchecked_R/O ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" "%WinDir%\Explorer.exe" "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" Powershell -Command Mount-DiskImage -ImagePath "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_Mounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF EXIST "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" Powershell -Command DisMount-DiskImage -ImagePath "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\XPLANE9.iso" && ECHO %ComputerName% ; X-Plane ; ISO_UnMounted ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; ISO_UnMounted ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
NETSH firewall add allowedprogram "%ProgramFiles(x86)%\X-Plane-Fly-To-Learn\X-Plane.exe" XPlane ENABLE  && ECHO %ComputerName% ; X-Plane ; Firewall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Firewall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /c /h /r /i /s /d "%PATH_PROGRAMS%\*.lnk" "%SystemDrive%\Users\Public\Desktop\" && ECHO %ComputerName% ; X-Plane ; Shortcut ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; X-Plane ; Shortcut ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd