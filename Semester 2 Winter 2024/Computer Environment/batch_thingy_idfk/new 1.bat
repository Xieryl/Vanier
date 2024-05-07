@echo off


:: echo is used to show messages texts or instructions
echo Goodbye 


::Variable in Batch

SET stringA = Hello
SET stringB = Goodbye
SET comma = ,

SET combine = %variable_name%  %comma% %tringB%

tree "C:\Users\efren"> C:\Users\efren\Downloads\LMAO.txt
echo "the ist is complete"



:: This batch WILL list details of your OS, list ALL hardware and 
:: network configuration

TITLE My info systeminfo
ECHO Please wait ... I am checking your system information

::pat1: OS info

systeminfo | findstr /c:"Version" 
systeminfo | findstr /c:"Type" 

ECHO ===============================


:: This command it is to not close the file automatically
pause