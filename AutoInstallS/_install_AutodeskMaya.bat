set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Autodesk\Maya2018\Img
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramFiles%\Autodesk\Maya2018\bin\maya.exe" "%PATH_PROGRAMS%\Setup.exe" /W /Q /I %PATH_PROGRAMS%\AutodeskMaya2018.ini /language en-us && ECHO %ComputerName% ; AutodeskMaya2018 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Autodesk\Maya2018\bin\maya.exe" (ECHO %ComputerName% ; AutodeskMaya2018 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AutodeskMaya2018 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd