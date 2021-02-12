set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Mozilla
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM IF NOT EXIST "%WINDIR%\%~nx0" (GOTO :PROCESSSTART) ELSE (del /q /f "%WINDIR%\%~nx0")

REM pushd %_CUR_PATH%

:PROCESSSTART
REM IF EXIST "%ProgramFiles%\Mozilla Firefox\firefox.exe" (
IF EXIST "C:\Users\oses\AppData\Local\Mozilla Firefox\firefox.exe" (
      GOTO :UNSFIREFOX
   ) ELSE (
      GOTO :INSFIREFOX
   )

:UNSFIREFOX
REM "%ProgramFiles%\Mozilla Firefox\uninstall\helper.exe" -ms && ECHO %ComputerName% ; Firefox ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles%\Mozilla Firefox\firefox.exe" (ECHO %ComputerName% ; Firefox ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Firefox ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
"C:\Users\oses\AppData\Local\Mozilla Firefox\uninstall\helper.exe" -ms && ECHO %ComputerName% ; Firefox ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
Del /F /Q "C:\Users\oses\Desktop\Firefox.lnk"
Del /F /S /Q "C:\Users\oses\AppData\Local\Mozilla Firefox"
IF NOT EXIST "C:\Users\oses\AppData\Local\Mozilla Firefox\firefox.exe" (ECHO %ComputerName% ; Firefox ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Firefox ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   
:INSFIREFOX
REM "%PATH_PROGRAMS%\Firefox.exe" -ms && ECHO %ComputerName% ; Firefox ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF EXIST "%ProgramFiles%\Mozilla Firefox\firefox.exe" (ECHO %ComputerName% ; Firefox ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Firefox ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
REM "%PATH_PROCESS%\SetDefaultBrowser.exe ff" && ECHO %ComputerName% ; Firefox ; SetDefault ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"