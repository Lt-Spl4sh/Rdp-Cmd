@echo off
cls
set /p host="Enter the remote computer IP or hostname: "
set /p user="Enter the username: "
set /p pass="Enter the password (leave blank for none): "

if "%pass%"=="" (
    echo No password entered, using manual login...
    mstsc /v:%host% /prompt
) else (
    echo %pass% > pass.txt
    cmdkey /generic:%host% /user:%user% /pass:%pass%
    mstsc /v:%host%
    cmdkey /delete:%host%
    del pass.txt
)

exit
