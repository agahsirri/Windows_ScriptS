set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\ArduinoIDE
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Arduino\arduino.exe" (
      GOTO :UNSARDUINOIDE
   ) ELSE (
      GOTO :INSARDUINOIDE
   )

:UNSARDUINOIDE
"%ProgramFiles(x86)%\Arduino\uninstall.exe" /S && ECHO %ComputerName% ; ArduinoIDE ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\ArduinoIDE\MakerWare\makerware.exe" (ECHO %ComputerName% ; ArduinoIDE ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; ArduinoIDE ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSARDUINOIDE
"%WinDir%\System32\certutil.exe" /addstore /f "TrustedPublisher" "%PATH_PROCESS%\_install_ArduinoIDE_1.cer" && ECHO %ComputerName% ; ArduinoIDE ; certificate_1 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; ArduinoIDE ; certificate_1 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\certutil.exe" /addstore /f "TrustedPublisher" "%PATH_PROCESS%\_install_ArduinoIDE_2.cer" && ECHO %ComputerName% ; ArduinoIDE ; certificate_2 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; ArduinoIDE ; certificate_2 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\certutil.exe" /addstore /f "TrustedPublisher" "%PATH_PROCESS%\_install_ArduinoIDE_3.cer" && ECHO %ComputerName% ; ArduinoIDE ; certificate_3 ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; ArduinoIDE ; certificate_3 ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\ArduinoIDE.exe" /S && ECHO %ComputerName% ; ArduinoIDE ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Arduino\arduino.exe" (ECHO %ComputerName% ; ArduinoIDE ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; ArduinoIDE ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd