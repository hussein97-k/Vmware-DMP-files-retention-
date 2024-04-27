@echo off
setlocal

REM Directory containing the .dmp files
set "directory=user\appdata\...\VDM\Dumps"

REM Number of days to keep files
set days_threshold=30

REM Get current date
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
  set "mm=%%a"
  set "dd=%%b"
  set "yyyy=%%c"
)

REM Calculate threshold date
set /a "dd=%dd%-%days_threshold%"
if %dd% lss 1 (
  set /a "mm=%mm%-1"
  if %mm% lss 1 (
    set /a "mm=12"
    set /a "yyyy=%yyyy%-1"
  )
  if %mm% equ 2 (
    set leap=0
    set /a "leap=(%yyyy%%%4)"
    if %leap% equ 0 (
      set /a "leap=(%yyyy%%%100)"
      if %leap% equ 0 (
        set /a "leap=(%yyyy%%%400)"
        if %leap% equ 0 set /a "leap=1"
      )
      if %leap% equ 0 set /a "dd=29"
    )
    if %leap% neq 0 set /a "dd=28"
  ) else if %mm% equ 4 if %mm% equ 6 if %mm% equ 9 if %mm% equ 11 set /a "dd=30"
)

REM Format the date
set "threshold_date=%yyyy%-%mm%-%dd%"

REM Iterate through files in the directory
for %%F in ("%directory%\*.dmp") do (
  REM Get last modified date of the file
  for %%a in ("%%~tF") do set "file_date=%%~ta"
  REM Extract the date part
  set "file_date=!file_date:~0,10!"
  REM Compare the file date with the threshold date
  if !file_date! lss %threshold_date% (
    REM Delete the file
    del "%%F"
    echo Deleted "%%F"
  )
)

endlocal
