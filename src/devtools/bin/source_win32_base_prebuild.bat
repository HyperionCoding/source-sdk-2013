@echo off
setlocal

set LIB_FILE=%~1
set LIB_DIR=%~2
set TOUCH_EXE=%~3
set VPC_EXE=%~4
set VPC_OUTPUT=%~5

if not exist "%LIB_FILE%" goto :make_dir

attrib "%LIB_FILE%" | find "R" >nul
if not errorlevel 1 (
    attrib -r "%LIB_FILE%"
    "%TOUCH_EXE%" -d "1999-01-01" "%LIB_FILE%"
    attrib +r "%LIB_FILE%"
)
goto :vpc

:make_dir
mkdir "%LIB_DIR%"

:vpc
"%VPC_EXE%" -crc2 "%VPC_OUTPUT%"

endlocal
