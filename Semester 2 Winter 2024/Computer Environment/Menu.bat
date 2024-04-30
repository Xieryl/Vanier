@echo off
:Menu
echo =Menu===============================
echo.
echo  1 Have some fun
echo  2 Get a water
echo.
echo  T Tip
echo  C Clear Screen
echo.
set /p M=Make a choice or hit Enter to quit: 
if %M% == 1 echo Have some fun by adding some more code right here
if %M% == 2 echo Get a water ad then add some code right here
if %M% == T echo It's easy to add a line seperator using one or more fake labels
if %M% == C cls
if %M% == pause
echo.
goto Menu