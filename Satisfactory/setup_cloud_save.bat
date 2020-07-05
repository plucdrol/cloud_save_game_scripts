@echo off

:setvariables

set LOCAL_DIR=%LOCALAPPDATA%\FactoryGame

set SAVES_PARENT_DIR_NAME=Saved
set SAVES_DIR_NAME=SaveGames
set OLD_TIMESTAMP=old

set LOCAL_SAVES_DIR=%LOCAL_DIR%\%SAVES_PARENT_DIR_NAME%

set CLOUD_DIR=%USERPROFILE%\Google Drive\cloud_save_games\Satisfactory

set CLOUD_SAVES_DIR=%CLOUD_DIR%\%SAVES_PARENT_DIR_NAME%

:menu

set input=x
echo Enter [S] to setup the cloud save symbolic link
echo Enter [M] to migrate your own local files to the cloud save
echo Enter [R] to revert the local damage (if previous messages looked like errors)
echo Enter anything else to exit the program.
set /p input=

if /I "%input%" EQU "S" goto start
IF /I "%input%" EQU "R" goto revert
IF /I "%input%" EQU "M" goto migrate
goto exit

:start

echo A symbolic link will be created between %LOCAL_SAVES_DIR%\%SAVES_DIR_NAME% and %CLOUD_SAVES_DIR%\%SAVES_DIR_NAME%.
echo Enter [X] to cancel and exit. 
echo Enter anything else to do the bartman.
set /p doexit=

IF "%doexit%" EQU "X" goto exit

echo Setting up link...

cd %LOCAL_SAVES_DIR%
ren %SAVES_DIR_NAME% %SAVES_DIR_NAME%_%OLD_TIMESTAMP%
mklink /D "%LOCAL_SAVES_DIR%\%SAVES_DIR_NAME%" "%CLOUD_SAVES_DIR%\%SAVES_DIR_NAME%"

echo Done, cloud save ready!
goto menu

:revert

echo Reverting damage done in %LOCAL_SAVES_DIR%

rmdir "%LOCAL_SAVES_DIR%\%SAVES_DIR_NAME%"
ren %SAVES_DIR_NAME%_%OLD_TIMESTAMP% %SAVES_DIR_NAME%

echo Done
goto menu

:migrate

echo Migrating local save files in %LOCAL_SAVES_DIR%\%SAVES_DIR_NAME%_%OLD_TIMESTAMP% to %CLOUD_SAVES_DIR%\%SAVES_DIR_NAME%
xcopy /e /v %LOCAL_SAVES_DIR%\%SAVES_DIR_NAME%_%OLD_TIMESTAMP% "%CLOUD_SAVES_DIR%\%SAVES_DIR_NAME%"

echo Done
goto menu

:exit
pause