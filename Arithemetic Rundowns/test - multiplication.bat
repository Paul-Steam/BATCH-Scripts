@ECHO off

:: CMD Settings:
TITLE Test.BAT - Multiplication
COLOR 0a

:: Global Var Declaration
:restart
ECHO [MULTIPLICATION] ENTER VARIABLES: 
set /P input1= 
set /P input2= 

:: function call
CALL :multiply %input1% %input2%

:: Function definition
:multiply
SETLOCAL
:: Vars
set /A compare=0
set retval=0
set left=%1
set right=%2
:: Error Check
echo %right%|findstr /r "[^a-zA-Z]" > nul
if errorlevel 1  goto errortag
echo %left%|findstr /r "[^a-zA-Z]" > nul
if errorlevel 1  goto errortag
:: use '/A' for arithmetic
set /A "retval=left*right" 
ENDLOCAL & SET result=Result of (%1 x %2): %retval%

:: Output
ECHO %result% 
pause
exit

:: Error Output
:errortag
echo [ERROR] NON Numeric Variables Inputed
pause
goto restart :: Recurse