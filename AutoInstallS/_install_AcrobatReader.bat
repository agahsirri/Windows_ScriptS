set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" (
      GOTO :UNSACROBAT
   ) ELSE (
      GOTO :INSACROBAT
   )

:UNSACROBAT
wmic product where name="Adobe Acrobat Reader DC" call uninstall && ECHO %ComputerName% ; AcrobatReader ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" (ECHO %ComputerName% ; AcrobatReader ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") else (ECHO %ComputerName% ; AcrobatReader ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSACROBAT
"%PATH_PROGRAMS%\AcrobatReader.exe" /qn EULA_ACCEPT=YES AgreeToLicense=Yes RebootYesNo=No /sAll && ECHO %ComputerName% ; AcrobatReader ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" (ECHO %ComputerName% ; AcrobatReader ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") else (ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
REM popd