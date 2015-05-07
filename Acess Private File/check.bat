@ECHO off
color 3

:check
tasklist /nh /fi "imagename eq AccessUnknown.exe" | find /i "AccessUnknown.exe" >nul && (
echo Is running, Checking again...
	TIMEOUT 1
	goto check
	
		) || (

echo Not running, Closing explorer
	taskkill /f /IM explorer.exe
	Start RestartExplorer.bat
	TIMEOUT 1
	EXIT
)
pause>nul
