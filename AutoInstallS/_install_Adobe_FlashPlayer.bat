set PATH_PROGRAMS=\\172.2.2.4\Software\ProgramS\BasicKit
set PATH_LOGS=\\172.2.2.4\Software\ProgramS\_LogS

pushd %PATH_PROGRAMS%

%PATH_PROGRAMS%\FlashPlayer\uninstall_flash_player.exe" -uninstall && ECHO %ComputerName% ; FPlayer_Plugin; uninstall ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; uninstall ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer_11_3_plugin.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Plugin; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Plugin ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_ActiveX.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_ActiveX; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_ActiveX ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_Npapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Npapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Npapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\FlashPlayer\FlashPlayer32_Ppapi.msi" /quiet /qn /norestart && ECHO %ComputerName% ; FPlayer_Ppapi; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; FPlayer_Ppapi ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%WinDir%\System32\msiexec.exe" /i "%PATH_PROGRAMS%\ShockWavePlayer.msi" /quiet /qn /norestart && ECHO %ComputerName% ; Shockwave ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Shockwave ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
"%PATH_PROGRAMS%\SilverLight.exe" /q /doNotRequireDRMPrompt /noupdate && ECHO %ComputerName% ; Silverlight ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Silverlight ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
RMDIR /S /Q "%WinDir%\Temp\." && ECHO %ComputerName% ; %WinDir%\Temp ; Flush ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; %WinDir%\Temp ; Flush ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"

popd