set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Autodesk\InventorHSM2019\Img
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

:PROCESSSTART
IF EXIST "%ProgramFiles%\Autodesk\Inventor HSM 2019\editor\AutodeskHSMEdit.exe" (
      GOTO :UNSINVENTHSM
   ) ELSE (
      GOTO :INSINVENTHSM
   )

:UNSINVENTHSM
wmic /node:"%ComputerName%" product where "Name like '%%Inventor HSM%%'" call uninstall && ECHO %ComputerName% ; AutodeskInventorHSM ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%SystemDrive%\Software\Inventor*HSM*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d %%G IN ("%ProgramFiles%\Autodesk\Inventor*HSM*") DO RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
FOR /d /r "%SystemDrive%\Users\" %%G IN (AppData\Local\Inventor*HSM*) DO (RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
FOR /d /r "%SystemDrive%\Users\" %%G IN (AppData\Roaming\Autodesk\Inventor*HSM*) DO (RMDIR /S /Q "%%~G" && ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventorHSM ; Deleted_"%%~G" ; OK ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
dir /a:d "%ProgramFiles%\Autodesk\Inventor*HSM*" && ECHO %ComputerName% ; AutodeskInventorHSM ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AutodeskInventorHSM ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

:INSINVENTHSM
REM IF NOT EXIST "%ProgramFiles%\Autodesk\Inventor HSM 2019\bin\InventorHSM.exe" "%PATH_PROGRAMS%\Setup.exe" /t /qb /lang en-US /c InventorHSM: PRODUCTEDITION=INHSMP ACADSERIALPREFIX=564 ACADSERIALNUMBER=16428634 ADLM_PRODKEY=C13K1 InstallLevel=5 && ECHO %ComputerName% ; AutodeskInventorHSM2019 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Autodesk\Inventor HSM 2019\editor\AutodeskHSMEdit.exe" "%PATH_PROGRAMS%\Setup.exe" /W /Q /I %PATH_PROGRAMS%\AutodeskInventorHSM2019.ini /language en-us && ECHO %ComputerName% ; AutodeskInventorHSM2019 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Autodesk\Inventor HSM 2019\editor\AutodeskHSMEdit.exe" (ECHO %ComputerName% ; AutodeskInventorHSM2019 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AutodeskInventorHSM2019 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd