@echo off
setlocal
set bat_file_dir=%~dp0

if defined LOCALAPPDATA (
  set link_path=%LOCALAPPDATA%\nvim
) else if defined USERPROFILE (
  set link_path=%USERPROFILE%\AppData\Local\nvim
) else if defined USERNAME (
  set link_path=C:\Users\%USERNAME%\AppData\Local\nvim
)

if not defined link_path (
  echo "Could not set the path of the symbolic link."
  call :wait
  exit /b 127
) else if exist "%link_path%" (
  echo "%link_path%" already exists
  call :wait
  exit /b 1
)

echo Make symbolic link to "%link_path%"

set target_path=%bat_file_dir%
set arguments='/c,mklink,/d,\"%link_path%\",\"%target_path%\"'

powershell ^
  -Command Start-Process ^
  -FilePath "cmd" ^
  -ArgumentList "%arguments%" ^
  -Verb Runas

call :wait

endlocal
exit /b 0

:wait
  timeout /t 5 /nobreak
  exit /b 0

