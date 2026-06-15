@echo off
setlocal

REM History Museum A&D kiosk startup
REM This runs the kiosk directly from the Git clone folder.

set "KIOSK_ROOT=C:\AandD2025remake\HistoryMuseum"
set "KIOSK_URL=http://localhost:8000/arrivals%%20and%%20departures.html"
set "EDGE_EXE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"

if not exist "%KIOSK_ROOT%" (
  echo ERROR: Kiosk folder not found:
  echo   "%KIOSK_ROOT%"
  pause
  exit /b 1
)

cd /d "%KIOSK_ROOT%"

REM Start local Python web server if port 8000 is not already listening.
netstat -ano | findstr /R /C:":8000 .*LISTENING" >nul
if errorlevel 1 (
  echo Starting Python server on http://localhost:8000/
  start "A&D Python Server" /min cmd /c "cd /d ""%KIOSK_ROOT%"" && py -m http.server 8000"
  timeout /t 3 /nobreak >nul
) else (
  echo Python server already appears to be running on port 8000.
)

if not exist "%EDGE_EXE%" set "EDGE_EXE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

if not exist "%EDGE_EXE%" (
  echo ERROR: Microsoft Edge executable not found.
  pause
  exit /b 1
)

echo Opening kiosk page...
start "A&D Kiosk" "%EDGE_EXE%" --kiosk "%KIOSK_URL%" --edge-kiosk-type=fullscreen --no-first-run

endlocal
