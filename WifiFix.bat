@echo off
title Testsigning
color 1b

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
echo Testsigning by: Henry Nguyen
echo :-------------------------------------
:PROMPT
SET /P choice=Do you wish to enable AutoConfig (Y/N)? 
IF /I "%choice%"== "Y" GOTO yes
IF /I "%choice%"== "N" GOTO no
if not '%choice%'==''
ECHO "%choice%" is not valid, try again
GOTO Prompt

:yes
START cmd.exe /k "netsh wlan set autoconfig enabled=yes interface="Wireless Network Connection" "
goto END

:no
START cmd.exe /k "netsh wlan set autoconfig enabled=no interface="Wireless Network Connection" 
goto END

:END
exit
