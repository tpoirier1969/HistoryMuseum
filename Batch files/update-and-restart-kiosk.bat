@echo off
setlocal

REM ==================================================
REM A&D Museum Kiosk Update + Restart
REM Intended for Windows Task Scheduler twice daily.
REM Checks network, pulls latest Git files, copies them to
REM the live kiosk folder, then starts/restarts the kiosk.
REM ==================================================

set "REPO_FOLDER=C:\AandD2025remake"
set "LIVE_FOLDER=C:\AandD Remake"
set "START_KIOSK_BAT=C:\AandD Remake\start-kiosk.bat"
set "LOG_FILE=C:\AandD Remake\kiosk-update-log.txt"
set "BRANCH=main"

if not exist "%LIVE_FOLDER%" mkdir "%LIVE_FOLDER%"

echo ================================================== >> "%LOG_FILE%"
echo Update started: %date% %time% >> "%LOG_FILE%"

REM Check for internet/network availability.
ping -n 1 github.com >nul 2>&1
if errorlevel 1 (
    echo No network/internet. Skipping Git update. >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 0
)

REM Close Edge before copying files so the kiosk does not hold files open.
echo Closing Edge before update... >> "%LOG_FILE%"
taskkill /IM msedge.exe /F >> "%LOG_FILE%" 2>&1

REM Go to repo folder.
cd /d "%REPO_FOLDER%"
if errorlevel 1 (
    echo ERROR: Could not access repo folder: %REPO_FOLDER% >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 1
)

REM Make sure Git is available.
git --version >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    echo ERROR: Git command not found. Install Git or repair PATH. >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 1
)

REM Fetch and pull latest files.
echo Pulling latest files from Git branch %BRANCH%... >> "%LOG_FILE%"
git fetch origin >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    echo ERROR: Git fetch failed. Starting existing kiosk files. >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 1
)

git pull origin %BRANCH% >> "%LOG_FILE%" 2>&1
if errorlevel 1 (
    echo ERROR: Git pull failed. Starting existing kiosk files. >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 1
)

REM Copy repo files to live kiosk folder.
REM /MIR mirrors the folder. Excludes Git internals, GitHub metadata, and logs.
echo Copying files to live kiosk folder... >> "%LOG_FILE%"
robocopy "%REPO_FOLDER%" "%LIVE_FOLDER%" /MIR /XD ".git" ".github" /XF "kiosk-update-log.txt" "kiosk-start-log.txt" >> "%LOG_FILE%" 2>&1

REM Robocopy exit codes 0-7 are normal/success-ish. 8+ means failure.
if %ERRORLEVEL% GEQ 8 (
    echo ERROR: Robocopy failed with code %ERRORLEVEL%. >> "%LOG_FILE%"
    if exist "%START_KIOSK_BAT%" call "%START_KIOSK_BAT%"
    exit /b 1
)

REM Make sure the latest startup batch file remains in the live folder.
REM This protects it if the repo does not contain the batch file.
if not exist "%START_KIOSK_BAT%" (
    echo WARNING: start-kiosk.bat was not found after copy. >> "%LOG_FILE%"
) else (
    echo Startup batch file present. >> "%LOG_FILE%"
)

echo Update finished: %date% %time% >> "%LOG_FILE%"

REM Restart kiosk.
if exist "%START_KIOSK_BAT%" (
    call "%START_KIOSK_BAT%"
) else (
    echo ERROR: Cannot restart kiosk. Missing %START_KIOSK_BAT% >> "%LOG_FILE%"
    exit /b 1
)

endlocal
