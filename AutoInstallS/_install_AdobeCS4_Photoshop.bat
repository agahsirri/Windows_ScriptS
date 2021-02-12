set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\AdobeCS4\_UnattendedInstallerS\AdobeCS4_AcrobatPro_Photoshop
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramFiles%\Adobe\Adobe Photoshop CS4 (64 Bit)\Photoshop.exe" "%PATH_PROGRAMS%\AdobeUberInstaller.exe" && ECHO %ComputerName% ; AdobeCS4_Photoshop ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Adobe\Adobe Photoshop CS4 (64 Bit)\Photoshop.exe" (ECHO %ComputerName% ; AdobeCS4_Photoshop ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; AdobeCS4_Photoshop ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
REM "\\172.2.5.1\software\programs\Adobe CS4\Setup.exe" --mode=silent --deploymentFile="\\172.2.5.1\Software\ProgramS\Adobe CS4\Adobe Creative Suite 4 Master Collection.install-AcrobatPro.xml" --skipProcessCheck=1

REM popd