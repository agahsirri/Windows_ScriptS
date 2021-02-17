set PATH_PROGRAMS="CertiportConsole.exe"
REM set PATH_PROGRAMS="activmgr.exe"
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
REM set PATH_PROCESS1="%ProgramFiles%\Activ Software\ActivDriver"
REM set PATH_PROCESS2="%ProgramFiles(x86)%\Activ Software\ActivDriver"
set PATH_PROCESS1="%ProgramFiles%\WindowsApps__"
set PATH_PROCESS2="c:\Certiport\Console"

((dir /s %PATH_PROCESS1% | find %PATH_PROGRAMS%) || (dir /s %PATH_PROCESS2% | find %PATH_PROGRAMS%)) && ECHO %ComputerName% ; %PATH_PROGRAMS% ; exist ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; %PATH_PROGRAMS% ; exist ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM ((dir /s "%ProgramFiles%\WindowsApps" | find "excel.exe") || (dir /s "%ProgramFiles%\Microsoft Office" | find "excel.exe")) && calc.exe || notepad.exe