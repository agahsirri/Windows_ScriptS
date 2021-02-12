set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.2.4\Software\ProgramS\_ScriptS
set PATH_CONFIG=\\172.2.2.4\Software\ProgramS\_ConfigS\BiOS

pushd %PATH_PROGRAMS%

"%PATH_PROGRAMS%\KLiteCodec.exe" /verysilent /norestart /LoadInf="%PATH_PROGRAMS%\KLiteCodec.ini" && ECHO %ComputerName% ; KLiteCodec ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\WinRar.exe" /S && ECHO %ComputerName% ; WinRar ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; WinRar ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

popd