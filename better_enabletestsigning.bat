@echo off
title Testsigning
color 1b

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

echo Testsigning by: Henry Nguyen
echo :-------------------------------------
:PROMPT
SET /P choice=Do you wish to enable Testsigning (Y/N)? 
IF /I "%choice%"== "Y" GOTO yes
IF /I "%choice%"== "N" GOTO no
if not '%choice%'==''
ECHO "%choice%" is not valid, try again

: execute
start cmd /k Bcdedit.exe /set TESTSIGNING ON
goto END

: executeNO
start cmd /k Bcdedit.exe /set TESTSIGNING OFF
goto END

:END
shutdown /r /c "Restarting computer to apply changes"
endlocal
exit