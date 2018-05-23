@echo off
title Testsigning
color 1b

if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

echo Testsigning by: Henry Nguyen
echo :-------------------------------------
:PROMPT
SET /P choice=Do you wish to enable Testsigning (Y/N)? 
IF /I "%choice%"== "Y" GOTO yes
IF /I "%choice%"== "N" GOTO no
if not '%choice%'==''
ECHO "%choice%" is not valid, try again

:yes
start cmd /k Bcdedit.exe /set TESTSIGNING ON
goto END

:no
start cmd /k Bcdedit.exe /set TESTSIGNING OFF
goto END

:END
shutdown /r /c "Restarting computer to apply changes"
endlocal
exit
