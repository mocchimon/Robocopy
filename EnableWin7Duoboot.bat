@echo off
title NetTools
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

:PROMPT
SET /P choice=Win7 = 1, nothing = 2: 
IF /I "%choice%"== "1" GOTO Win7
IF /I "%choice%"== "2" GOTO nothing
if not '%choice%'==''
ECHO "%choice%" is not valid, try again

:Win7
start cmd /k Bcdboot E:\Windows
goto no

:nothing
start 
goto no

:no
exit
