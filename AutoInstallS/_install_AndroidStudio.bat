set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\AndroidStudio
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramFiles%\Java\jdk1.8.0_181\bin\java.exe" "%PATH_PROGRAMS%\JavaJDK.exe" /s && ECHO %ComputerName% ; JavaJDK ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JavaJDK ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Android\Android Studio\bin\studio64.exe" "%PATH_PROGRAMS%\AndroidStudio.exe" /S /AllUsers && ECHO %ComputerName% ; AndroidStudio ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AndroidStudio ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM IF NOT EXIST "%ProgramFiles%\Android\Android Studio\SDK" mkdir "%ProgramFiles%\Android\Android Studio\SDK"
"%WinDir%\Regedit.exe" /s "%PATH_PROCESS%\_install_AndroidStudio.reg" && ECHO %ComputerName% ; AndroidStudio ; Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AndroidStudio ; Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
XCopy /y /e /c /h /r /i "%PATH_PROGRAMS%\SDK" "%ProgramData%\Android\SDK" && ECHO %ComputerName% ; AndroidStudio ; SDK_Copy ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AndroidStudio ; SDK_Copy ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

REM popd