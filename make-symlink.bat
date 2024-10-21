@echo off
setlocal
set current_dir=%~dp0

set link_path=%LOCALAPPDATA%\nvim
set target_path=%current_dir%

if exist "%link_path%" (
	echo Link ^("%link_path%"^) already exists
	exit /b 1
)

set arguments="'/c,mklink,/d,\"%link_path%\",\"%target_path%\"'"

powershell ^
	-Command Start-Process ^
	-FilePath "cmd" ^
	-ArgumentList %arguments% ^
	-Verb Runas

timeout /t 5 /nobreak
endlocal
