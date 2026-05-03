@echo off
setlocal

set TARGET_FILE=%~1
set TARGET_DIR=%~2
set TARGET_FILENAME=%~nx1

if not exist "%TARGET_FILE%" goto :done

for /f "delims=" %%A in ('attrib "%TARGET_FILE%"') do set valveTmpIsReadOnly=%%A
set valveTmpIsReadOnlyLetter=%valveTmpIsReadOnly:~6,1%

if "%valveTmpIsReadOnlyLetter%"=="R" del /q "%TARGET_DIR%%TARGET_FILENAME%"

:done
endlocal
