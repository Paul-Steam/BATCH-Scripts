@ECHO off
title Access Unknown
color 3

:: Vars
set /a tries=3
set password=1337
set default=9001
set variable_new=%RANDOM%4

:: Find File, Read it
FOR /F "tokens=1" %%G IN (C:\Users\Asus\Documents\ID_KEY.txt) DO SET variable_old=%%G

:: More Vars
set old_dir=C:\Users\Asus\Documents\%variable_old%
set new_dir=C:\Users\Asus\Documents\%variable_new%


:top
echo.
echo ----------------------------------------------
echo.
echo 	  Hidden Folder Access
echo.
echo ----------------------------------------------
echo You have %tries% attempts left.
echo Enter password..
echo ----------------------------------------------
:: Var Check
if %tries%==1 (
	echo [OS] Penalty after 3 failed tries.
	)

if %tries%==0 (
	goto penalty
	)

:: User Input
set /p pass=
:: Data Check
if %pass%==%password% (
goto correct 
)
set /A "tries=%tries%-1"
cls
goto top



:penalty :: Shutdown PC As penalty
echo [OS] Sorry, too many incorrect passwords, initiating lockdown.
start shutdown -l -f -t 35 -c "LOCKDOWN INITIATED"
pause
EXIT



:correct
cls
echo ----------------------------------------------
echo Password Accepted!
echo.
echo 		Opening Folder...
echo ----------------------------------------------
:: Open Explorer.exe
explorer %old_dir%
echo [OS] - ( Valid Folder is open untill User Input )
start check.bat
pause 
:: Reboot Explorer , prevents reloading file.
taskkill /f /IM explorer.exe
Start explorer.exe

:: Set Atrributes to the new file location and writes New ID - Security System
ATTRIB -h %old_dir%
REN %old_dir% %variable_new%
ATTRIB +h %new_dir%
echo %variable_new% > C:\Users\Asus\Documents\ID_KEY.txt
echo Folder Protected and changed _DIR...
echo [Completed.]
pause