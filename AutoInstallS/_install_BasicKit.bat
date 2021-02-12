set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS
set PATH_PROCESS=\\172.2.2.4\Software\ProgramS\_ScriptS
set PATH_CONFIG=\\172.2.2.4\Software\ProgramS\_ConfigS\BiOS

pushd %PATH_PROGRAMS%

gpupdate /force  && ECHO %ComputerName% ; GroupPolicy ; update ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; GroupPolicy ; update ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\TightVNCx64.msi" /norestart /passive && ECHO %ComputerName% ; TightVNC ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
SC STOP "tvnserver"
TIMEOUT 3
SC START "tvnserver" && (ECHO %ComputerName% ; TightVNC ; service ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; TightVNC ; service ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
TIMEOUT 3
SC QUERYEX "tvnserver" | FIND "STATE" | FIND /v "STOPPED" > NUL && (ECHO %ComputerName% ; TightVNC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") || (ECHO %ComputerName% ; TightVNC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
"%WinDir%\Regedit.exe" /s "%PATH_PROCESS%\_install_TightVNC.reg" && ECHO %ComputerName% ; TightVNC ; Register ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; TightVNC ; Register ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\AcrobatReader.exe" /qn EULA_ACCEPT=YES AgreeToLicense=Yes RebootYesNo=No /sAll && ECHO %ComputerName% ; AcrobatReader ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\KLiteCodec.exe" /verysilent /norestart /LoadInf="%PATH_PROGRAMS%\KLiteCodec.ini" && ECHO %ComputerName% ; KLiteCodec ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; AcrobatReader ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\ShockWavePlayer.msi" /quiet /qn /norestart && ECHO %ComputerName% ; Shockwave ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Shockwave ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\FlashPlayer\uninstall_flash_player.exe" -uninstall && ECHO %ComputerName% ; FPlayer_Plugin; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer_11_3_plugin.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Plugin; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_ActiveX.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_ActiveX; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_ActiveX ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_Npapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Npapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Npapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_Ppapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Ppapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Ppapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\SilverLight.exe" /q /doNotRequireDRMPrompt /noupdate && ECHO %ComputerName% ; Silverlight ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Silverlight ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\WinRar.exe" /S && ECHO %ComputerName% ; WinRar ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; WinRar ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
wmic product where "name like 'java%%'" call uninstall /nointeractive && ECHO %ComputerName% ; JavaJRE ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JavaJRE ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\JavaJRE.exe" /s && ECHO %ComputerName% ; JavaJRE ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JavaJRE ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\vlc_setup.exe" /L=1033 /S && ECHO %ComputerName% ; VLC ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; VLC ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
powershell -executionPolicy bypass -file "%PATH_PROCESS%\_UninstallSoftware.ps1" && ECHO %ComputerName% ; JunkSoftwareS ; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; JunkSoftwareS ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\Office365.exe" /configure "%PATH_PROGRAMS%\Office365.xml" && ECHO %ComputerName% ; MSOffice ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; MSOffice ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\_WindowsUpdateS.lnk"
"%PATH_CONFIG%\multiplatform_201808281612_wopsw.exe" --valsetuppwd=258i69 /l="%PATH_LOGS%\BIOSs\BIOS-%ComputerName%.log" && ECHO %ComputerName% ; BIOS ; update ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; BIOS ; update ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
RMDIR /S /Q "%WinDir%\Temp\." && ECHO %ComputerName% ; %WinDir%\Temp ; Flush ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; %WinDir%\Temp ; Flush ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

popd