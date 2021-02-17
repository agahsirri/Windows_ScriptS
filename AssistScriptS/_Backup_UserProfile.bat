set PATH_LOGS=\\172.2.5.1\Software\ProgramS\_LogS

robocopy /COPYALL /SECFIX /E "\\172.2.10.7\UserProfile$" "\\172.2.5.1\Software\ProgramS\_Backup\_UserProfile" /LOG+:"%PATH_LOGS%\%~n0_%date:~10,4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"