@echo off
setlocal
set bat_file_dir=%~dp0
set target_path=%bat_file_dir:~0,-1%

if defined LOCALAPPDATA (
  set base_dir=%LOCALAPPDATA%
) else if defined USERPROFILE (
  set base_dir=%USERPROFILE%\AppData\Local
) else if defined USERNAME (
  set base_dir=C:\Users\%USERNAME%\AppData\Local
)

if not defined base_dir (
  echo "Could not set the path of the symbolic link."
  call :wait
  exit /b 127
)

set link_path=%base_dir%\nvim
if exist "%link_path%" (
  echo "%link_path%" already exists
  call :wait
  exit /b 1
)

echo Make symbolic link from "%target_path%" to "%link_path%"

powershell ^
  -Command New-Item ^
    -ItemType Junction ^
    -Path "%link_path%" ^
    -Target "%target_path%"


call :wait

endlocal
exit /b 0

:wait
  timeout /t 5 /nobreak
  exit /b 0

