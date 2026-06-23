@echo off
setlocal

REM ==================================================
REM A&D Museum Kiosk Startup
REM Starts local Python web server and opens Edge kiosk mode.
REM ==================================================

set "SITE_FOLDER=C:\AandD Remake"
set "HOME_FILE=AandD Home.html"
set "PORT=8000"
set "URL=http://localhost:%PORT%/AandD%%20Home.html"
set "LOG_FILE=C:\AandD Remake\kiosk-start-log.txt"

if not exist "%SITE_FOLDER%" mkdir "%SITE_FOLDER%"

echo ================================================== >> "%LOG_FILE%"
echo Kiosk start requested: %date% %time% >> "%LOG_FILE%"

cd /d "%SITE_FOLDER%"
if errorlevel 1 (
    echo ERROR: Could not open site folder: %SITE_FOLDER% >> "%LOG_FILE%"
    exit /b 1
)

REM Start Python web server if nothing is already listening on this port.
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$p = Get-NetTCPConnection -LocalPort %PORT% -State Listen -ErrorAction SilentlyContinue; if (-not $p) { Start-Process -WindowStyle Minimized python -ArgumentList '-m http.server %PORT%' -WorkingDirectory '%SITE_FOLDER%' }"

REM Give server a moment to start.
timeout /t 2 /nobreak >nul

REM Open Edge in kiosk/fullscreen mode using localhost, NOT file://
start "" msedge --kiosk "%URL%" --edge-kiosk-type=fullscreen --no-first-run

echo Kiosk launched: %URL% >> "%LOG_FILE%"

endlocal
