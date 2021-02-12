set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\FSA
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\FSASecureBrowser\FSASecureBrowser.exe" (
      GOTO :UNSFSASBRW
   ) ELSE (
      GOTO :INSFSASBRW
   )

:UNSFSASBRW

"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\FSASecureBrowser.msi" /qn /norestart && ECHO %ComputerName% ; FSASecureBrowser ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\FSASecureBrowser\FSASecureBrowser.exe" (ECHO %ComputerName% ; FSASecureBrowser ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; FSASecureBrowser ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSFSASBRW
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FSASecureBrowser.msi" /qn /norestart && ECHO %ComputerName% ; FSASecureBrowser ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\FLSecureBrowser\FLSecureBrowser.exe" (ECHO %ComputerName% ; FSASecureBrowser ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; FSASecureBrowser ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd