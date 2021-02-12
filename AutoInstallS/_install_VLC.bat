set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\VideoLAN
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.2.4\Software\ProgramS\_ScriptS

REM IF NOT EXIST "%WINDIR%\%~nx0" (GOTO :PROCESSSTART) ELSE (del /q /f "%WINDIR%\%~nx0")

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\VideoLAN\VLC\vlc.exe" (
      GOTO :UNSVLC
   ) ELSE (
      GOTO :INSVLC
   )

:UNSVLC
"%ProgramFiles%\VideoLAN\VLC\uninstall.exe" /S && ECHO %ComputerName% ; VLC ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\VideoLAN\VLC\vlc.exe" (ECHO %ComputerName% ; VLC ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VLC ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   
:INSVLC
"%PATH_PROGRAMS%\vlc_setup.exe" /L=1033 /S && ECHO %ComputerName% ; VLC ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\VideoLAN\VLC\vlc.exe" (ECHO %ComputerName% ; VLC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; VLC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
