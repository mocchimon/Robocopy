if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)
echo Testsigning by: Henry Nguyen
echo :-------------------------------------

START cmd.exe /k "wmic memorychip get speed"
goto END

:END
exit