set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.5.1\Software\ProgramS\_ScriptS

pushd %PATH_PROGRAMS%

IF NOT EXIST "%ProgramFiles(x86)%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe" "%PATH_PROGRAMS%\AcrobatReader.exe" /qn EULA_ACCEPT=YES AgreeToLicense=Yes RebootYesNo=No /sAll && ECHO %ComputerName% ; AcrobatReader ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\K-Lite Codec Pack\unins000.exe" "%PATH_PROGRAMS%\KLiteCodec.exe" /verysilent /norestart /LoadInf="%PATH_PROGRAMS%\KLiteCodec.ini" && ECHO %ComputerName% ; KLiteCodec ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%WinDir%\SysWOW64\Adobe\Shockwave 12\SwInit.exe" "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\ShockWavePlayer.msi" /quiet /qn /norestart && ECHO %ComputerName% ; Shockwave ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Shockwave ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%WinDir%\system32\Macromed\Flash\NPSWF64_32_0_0_134.dll" "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer32_Npapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Npapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Npapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%WinDir%\system32\Macromed\Flash\pepflashplayer64_32_0_0_134.dll" "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer32_Ppapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Ppapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Ppapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\Microsoft Silverlight\sllauncher.exe" "%PATH_PROGRAMS%\SilverLight.exe" /q /doNotRequireDRMPrompt /noupdate && ECHO %ComputerName% ; Silverlight ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Silverlight ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\WinRAR\WinRAR.exe" "%PATH_PROGRAMS%\WinRar.exe" /S && ECHO %ComputerName% ; WinRar ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; WinRar ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles(x86)%\Java\jre1.8.0_191\bin\java.exe" "%PATH_PROGRAMS%\JavaJRE.exe" /s && ECHO %ComputerName% ; JavaJRE ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JavaJRE ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF NOT EXIST "%ProgramFiles%\VideoLAN\VLC\vlc.exe" "%PATH_PROGRAMS%\vlc_setup.exe" /L=1033 /S && ECHO %ComputerName% ; VLC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VLC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REN IF NOT EXIST "%ProgramFiles%\Microsoft Office\root\Office16\EXCEL.EXE" "%PATH_PROGRAMS%\Office365.exe" /configure "%PATH_PROGRAMS%\Office365.xml" && ECHO %ComputerName% ; MSOffice ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; MSOffice ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\Regedit.exe" /s "%PATH_PROCESS%\_install_TightVNC.reg" && ECHO %ComputerName% ; TightVNC ; Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TightVNC ; Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\TightVNC\tvnserver.exe" (
    "%WinDir%\System32\msiexec.exe" /x "%PATH_PROGRAMS%\TightVNCx64.msi" /norestart /passive && ECHO %ComputerName% ; TightVNC ; uninstall ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
    IF NOT EXIST "%ProgramFiles%\TightVNC\tvnserver.exe" (ECHO %ComputerName% ; TightVNC ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; TightVNC ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
    SC STOP "tvnserver"
    TIMEOUT 10
    SC START "tvnserver"
   ) ELSE (
    "%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TightVNCx64.msi" /norestart /passive && ECHO %ComputerName% ; TightVNC ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
    SC START "tvnserver"
    TIMEOUT 10
    SC QUERYEX "tvnserver" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; TightVNC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; TightVNC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
   )

powershell -executionPolicy bypass -file "%PATH_PROCESS%\_UninstallSoftware.ps1" && ECHO %ComputerName% ; JunkSoftwareS ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JunkSoftwareS ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
REM "%PATH_PROGRAMS%\_WindowsUpdateS.lnk"

popd