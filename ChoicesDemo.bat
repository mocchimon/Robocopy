@ECHO off
cls
:start
set choice=
set /p choice=Type the Y/N.
if /I '%choice%'=='Y' goto hello
if /I '%choice%'=='N' goto bye
if not '%choice%'==''
ECHO "%choice%" is not valid, try again
ECHO.
goto start
:hello
ECHO HELLO
goto end
:bye
ECHO BYE
goto end
:end
pause