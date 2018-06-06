@echo off
echo.                                                      
echo.                                                      
echo ======================================================================
echo =========    Ebuild 2.0 To Your PS4 Hard Drive ========
echo ======================================================================
echo.
echo.
 
:start
echo Do you want to copy this  Ebuild to your Playstation 4 Hard Drive?
SET /P copytokit=(y = yes; n = no; ENTER = yes):
@echo off
if not defined copytokit SET copytokit=y
if "%copytokit%" == "no" goto :start
if "%copytokit%" == "n" goto :start
if "%copytokit%" == "y" goto :ThePS4ip
if "%copytokit%" == "yes" goto :ThePS4ip
echo Please enter the path you want the Playstation 4 build to be copied to
SET /P PS4-folder=(include the trailing backslash):
if not defined PS4-folder goto :start
 
:ThePS4ip
echo off
echo
echo Enter the IP address of your Playstation 4  (OR)
echo
SET /P PS4ip=just press ENTER to use your PS4 Neighborhood Default kit:
if defined PS4ip goto :PS4copy
orbis-ctrl default > tmpketip.out
SET /P PS4ip=< tmpketip.out
del tmpketip.out
set PS4ip=%PS4ip: =%
set destination="O:\%PS4IP%\data\app"
echo off
FOR /F "delims=" %%i IN ('dir "<source>" /b /ad-h /t:c /od') DO SET a=%%i
set source="<source>"
goto :PS4Transfer
 
:PS4Transfer
echo Select the config to copy to your Playsation 4 (r = Release; f = Final)
SET /P copyconfig=or press ENTER to use the default config (Final):
if not defined copyconfig SET copyconfig=f
call orbis-ctrl.exe add %PS4ip%
call orbis-ctrl.exe connect %PS4ip%
call orbis-ctrl.exe map O
call robocopy "%source%" "%destination%" /copy:DAT /E /W:2 /R:0 /MT:8
if "%copyconfig%" == "r" copy "Q:\%PS4ip%\data\app\FIFAGame.Main_Ps4_release.elf" "eboot.bin"
if "%copyconfig%" == "f" copy "O:\%PS4ip%\data\app\FIFAGame.Main_Ps4_final.elf" "eboot.bin"
goto :end
 
:end
set copyconfig=
set copytokit=
set PS4ip=
set PS4ip=
pause