
@ECHO OFF

::In a batch file REM at the start of a line signifies a comment or REMARK.
:: Allow runs comments like ::
REM.-- Prepare the Command Processor


::SETLOCAL
::Starts localization of environment variables in a batch file. 
::Localization continues until a matching endlocal command is encountered or the end of the batch file is reached.
::https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/setlocal
SETLOCAL ENABLEEXTENSIONS
SETLOCAL ENABLEDELAYEDEXPANSION

:menuLOOP
echo.
echo.= Menu =================================================
echo.

::for loop syntax
::FOR /F ["YOUR_OPTIONS_HERE"] %%PEREMETER IN (file_name_here) DO (
::    command )

::/b	Matches the text pattern if it is at the beginning of a line.
::/c:<string>	Uses the specified text as a literal search string.

::~ before the digit will do something extra to the parameter. 
::%~0 will remove the quote marks of the first parameter if it has any. 
::""So, “test.bat” will output test.bat, “.\test.bat” will output .\test.bat.

::~f will expand the parameter to the full path name. 
::So %~f0 may expand to C:\dir\test.bat.
for /f "tokens=1,2,* delims=_ " %%A in ('"findstr /b /c:":menu_" "%~f0""') do echo.  %%B  %%C
set choice=
::The /P switch allows you to set the value of a variable to a line of 
::input entered by the user. Displays the specified promptString before 
::reading the line of input. The promptString can be empty.

echo.&set /p choice=Make a choice or hit ENTER to quit: ||GOTO:EOF
echo.&call:menu_%choice%
GOTO:menuLOOP

::-----------------------------------------------------------
:: menu functions follow below here
::-----------------------------------------------------------

:menu_1   Have some fun
echo.Have some fun by adding some more code right here
GOTO:EOF

:menu_2   Get a water
echo.Get a water and then add some code right here
GOTO:EOF

:menu_

:menu_T   Tip
echo.It's easy to add a line separator using one or more fake labels
GOTO:EOF

:menu_C   Clear Screen
cls
GOTO:EOF