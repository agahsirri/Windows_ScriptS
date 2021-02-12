set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\SmartSuite19
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%
:PROCESSSTART
IF EXIST "%ProgramFiles(x86)%\SMART Technologies\Education Software\Notebook.exe" (
      GOTO :UNSSMRTBRD
   ) ELSE (
      GOTO :INSSMRTBRD
   )

:UNSSMRTBRD
IF EXIST "%CommonProgramFiles%\SMART Technologies\SMART Uninstaller\SMART Uninstaller.exe" copy /Y "%CommonProgramFiles%\SMART Technologies\SMART Uninstaller\SMART Uninstaller.exe" "%TEMP%"
IF EXIST "%CommonProgramFiles(x86)%\SMART Technologies\SMART Uninstaller\SMART Uninstaller.exe" copy /Y "%CommonProgramFiles(x86)%\SMART Technologies\SMART Uninstaller\SMART Uninstaller.exe" "%TEMP%"
IF EXIST "%TEMP%\SMART Uninstaller.exe" start /wait "SMART Uninstaller" "%TEMP%\SMART Uninstaller.exe" --noui --uninstall-all --uilevel none
IF EXIST "%TEMP%\SMART Uninstaller.exe" del /Q "%TEMP%\SMART Uninstaller.exe"
wmic product where name="SMART Install Manager" call uninstall

"%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\SMARTLearningSuite.msi" /qn /norestart && ECHO %ComputerName% ; SmartSuite ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\SMART Technologies\Education Software\Notebook.exe" (ECHO %ComputerName% ; SmartSuite ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; SmartSuite ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

:INSSMRTBRD
REM --- B2_22 --- "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\SMARTLearningSuite.msi" NB_PROD_KEY=NC-2ABA2CEQYD94WQHSNAAAAAA ACTIVATE_LICENSE=1 CUSTOMER_LOGGING=0 PRODUCT_NOTIFICATION=0 START_SNMP_SERVICE=1 /qn /norestart && ECHO %ComputerName% ; SmartSuite19 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM -- Lynx_10 -- "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\SMARTLearningSuite.msi" NB_PROD_KEY=NC-2ACAGBERA87P39IAWC2PAAA ACTIVATE_LICENSE=1 CUSTOMER_LOGGING=0 PRODUCT_NOTIFICATION=0 START_SNMP_SERVICE=1 /qn /norestart && ECHO %ComputerName% ; SmartSuite19 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM -- Lynx__2 -- "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\SMARTLearningSuite.msi" NB_PROD_KEY=NC-2ACSWAWIFEGJZDPSNASPAAA ACTIVATE_LICENSE=1 CUSTOMER_LOGGING=0 PRODUCT_NOTIFICATION=0 START_SNMP_SERVICE=1 /qn /norestart && ECHO %ComputerName% ; SmartSuite19 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM --- B3_18 --- "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\SMARTLearningSuite.msi" NB_PROD_KEY=NC-2ACSNCEH9ITI8FWSECADAAA ACTIVATE_LICENSE=1 CUSTOMER_LOGGING=0 PRODUCT_NOTIFICATION=0 START_SNMP_SERVICE=1 /qn /norestart && ECHO %ComputerName% ; SmartSuite19 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\SMARTLearningSuite.msi" CUSTOMER_LOGGING=0 PRODUCT_NOTIFICATION=0 START_SNMP_SERVICE=1 /qn /norestart && ECHO %ComputerName% ; SmartSuite19 ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
SC QUERYEX "SmartControl" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; SmartSuite19 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; SmartSuite19 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF EXIST "%ProgramFiles(x86)%\SMART Technologies\Education Software\Notebook.exe" (ECHO %ComputerName% ; SmartSuite19 ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; SmartSuite19 ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
REM popd