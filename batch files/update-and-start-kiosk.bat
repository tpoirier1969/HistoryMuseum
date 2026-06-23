@echo off
setlocal

REM History Museum A&D kiosk updater + launcher
REM Confirmed working kiosk repo path:
REM   C:\AandD2025remake\HistoryMuseum

set "KIOSK_ROOT=C:\AandD2025remake\HistoryMuseum"
set "BATCH_DIR=%KIOSK_ROOT%\batch files"
set "START_SCRIPT=%BATCH_DIR%\start-kiosk.bat"
set "LOG_FILE=%BATCH_DIR%\kiosk-update-log.txt"

if not exist "%KIOSK_ROOT%" (
  echo ERROR: Kiosk folder not found:
  echo   "%KIOSK_ROOT%"
  pause
  exit /b 1
)

cd /d "%KIOSK_ROOT%"

if not exist "%KIOSK_ROOT%\.git" (
  echo ERROR: This folder is not a Git repository:
  echo   "%KIOSK_ROOT%"
  echo Make sure the kiosk clone is at C:\AandD2025remake\HistoryMuseum.
  pause
  exit /b 1
)

if not exist "%BATCH_DIR%" mkdir "%BATCH_DIR%"

echo ================================ >> "%LOG_FILE%"
echo Kiosk update started %date% %time% >> "%LOG_FILE%"

REM If offline, skip git update and just start the kiosk.
ping -n 1 github.com >nul 2>&1
if errorlevel 1 (
  echo Offline or github.com unreachable. Skipping update. >> "%LOG_FILE%"
  echo Network not available. Starting existing kiosk files.
  call "%START_SCRIPT%"
  exit /b 0
)

REM Close Edge before changing files under the running kiosk.
echo Closing Edge before update... >> "%LOG_FILE%"
taskkill /IM msedge.exe /F >nul 2>&1
timeout /t 2 /nobreak >nul

REM Use normal Git if installed. Otherwise try GitHub Desktop's bundled Git.
where git >nul 2>&1
if errorlevel 1 (
  set "GIT_EXE="
  for /d %%D in ("%LocalAppData%\GitHubDesktop\app-*") do (
    if exist "%%D\resources\app\git\cmd\git.exe" set "GIT_EXE=%%D\resources\app\git\cmd\git.exe"
  )
) else (
  set "GIT_EXE=git"
)

if "%GIT_EXE%"=="" (
  echo ERROR: git.exe not found. Install Git for Windows or GitHub Desktop. >> "%LOG_FILE%"
  echo ERROR: git.exe not found.
  echo Install Git for Windows or GitHub Desktop.
  pause
  exit /b 1
)

echo Fetching latest repo changes... >> "%LOG_FILE%"
"%GIT_EXE%" fetch origin >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
  echo WARNING: git fetch failed. Starting existing kiosk files. >> "%LOG_FILE%"
  call "%START_SCRIPT%"
  exit /b 0
)

echo Pulling latest repo changes... >> "%LOG_FILE%"
"%GIT_EXE%" pull --ff-only origin main >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
  echo WARNING: git pull failed. Starting existing kiosk files. >> "%LOG_FILE%"
  call "%START_SCRIPT%"
  exit /b 0
)

echo Kiosk update finished %date% %time% >> "%LOG_FILE%"

call "%START_SCRIPT%"
endlocal
