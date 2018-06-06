@echo off
echo.                                                      
echo.                                                      
echo ======================================================================
echo =========    Triple A title game Ebuild To Your PS4 Hard Drive    =========
echo ======================================================================
echo.
echo.
 
  
:start
echo Do you want to copy this Ebuild to your Playstation 4 Hard Drive?
SET /P copytokit=(y = yes; n = no; ENTER = yes):
if not defined copytokit SET copytokit=y
if "%copytokit%" == "y" goto :ThePS4ip
echo Please enter the path you want the Playstation 4 build to be copied to
SET /P PS4-folder=(include the trailing backslash):
if not defined PS4-folder goto :start
 
:copyPS4
echo Copying build to your PS4 at %PS4-folder%...
"C:\Windows\System32\xcopy.exe" /E /I <insert source here>
goto :end
 
:ThePS4ip
echo.
echo.
echo Enter the IP address of your Playstation 4  (OR)
echo.
SET /P PS4ip=just press ENTER to use your PS4 Neighborhood Default kit:
if defined PS4ip goto :PS4copy
orbis-ctrl default > tmpketip.out
SET /P PS4ip=< tmpketip.out
del tmpketip.out
set PS4ip=%PS4ip: =%
goto :PS4Transfer
 
:PS4Transfer
echo.
echo.
echo Select the config to copy to your Playsation 4 (r = Release; f = Final)
SET /P copyconfig=or press ENTER to use the default config (Final):
if not defined copyconfig SET copyconfig=f
call orbis-ctrl.exe add %PS4ip%
call orbis-ctrl.exe connect %PS4ip%
call orbis-ctrl.exe map O
call robocopy "<eBuild>" "<console\app>" *.* /xf *.bin /MIR /R:10 /W:10 /XO /XN
if "%copyconfig%" == "r" ren "<console>" "eboot.bin"
if "%copyconfig%" == "f" ren "<console>" "eboot.bin"
goto :end
 
:end
set copyconfig=
set copytokit=
set PS4ip=
set PS4ip=
pause
