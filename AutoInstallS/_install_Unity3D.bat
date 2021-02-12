set PATH_PROGRAMS=\\172.2.5.1\Software\ProgramS\Unity3D
set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

REM pushd %_CUR_PATH%

IF NOT EXIST "%ProgramFiles%\Unity\Editor\Unity.exe" "%PATH_PROGRAMS%\UnitySetup64.exe" -UI=reduced /D="%ProgramFiles%\Unity" && ECHO %ComputerName% ; Unity ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; Unity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Unity\Editor\Unity.exe" (ECHO %ComputerName% ; Unity ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; Unity ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "%ProgramFiles%\Unity\Editor\Data\Documentation\DocCombiner.exe" "%PATH_PROGRAMS%\UnityDocumentationSetup.exe" /S /D="%ProgramFiles%\Unity" && ECHO %ComputerName% ; UnityDocS ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; UnityDocS ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles%\Unity\Editor\Data\Documentation\DocCombiner.exe" (ECHO %ComputerName% ; UnityDocS ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; UnityDocS ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")
IF NOT EXIST "%ProgramFiles(x86)%\Microsoft Visual Studio Tools for Unity\15.0\Visual Studio 2017 Tools.unitypackage" "%PATH_PROGRAMS%\vs_Community.exe" --productId "Microsoft.VisualStudio.Product.Community" --add "Microsoft.VisualStudio.Workload.ManagedGame" --add "Microsoft.VisualStudio.Workload.NativeDesktop" --add "Microsoft.VisualStudio.Component.VC.Tools.x86.x64" --add "Microsoft.VisualStudio.Component.Windows10SDK.16299.Desktop" --campaign "Unity3d_Unity" --passive --norestart --wait && ECHO %ComputerName% ; vs_Community ; install ; STARTED ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log" || ECHO %ComputerName% ; vs_Community ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log"
IF EXIST "%ProgramFiles(x86)%\Microsoft Visual Studio Tools for Unity\15.0\Visual Studio 2017 Tools.unitypackage" (ECHO %ComputerName% ; vs_Community ; install ; OK ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log") ELSE (ECHO %ComputerName% ; vs_Community ; install ; FAIL ; %date% ; %time% >> "%PATH_LOGS%\%~n0.log")

REM popd