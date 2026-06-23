A&D Museum Kiosk Batch Files
============================

Files included:

1. start-kiosk.bat
   - Starts a Python local web server in C:\AandD Remake
   - Opens Edge in kiosk fullscreen mode at:
     http://localhost:8000/AandD%20Home.html

2. update-and-restart-kiosk.bat
   - Intended to be run by Windows Task Scheduler twice daily
   - Checks for network access
   - Closes Edge
   - Runs git fetch + git pull from C:\AandD2025remake
   - Mirrors files into C:\AandD Remake
   - Calls start-kiosk.bat when done

Expected paths:

Repo/source folder:
C:\AandD2025remake

Live kiosk folder:
C:\AandD Remake

Home file:
AandD Home.html

Important:
- The kiosk must open through localhost, not file:///.
- If your Git branch is not main, edit this line in update-and-restart-kiosk.bat:
  set "BRANCH=main"
- Put both .bat files into C:\AandD Remake.
- For startup, point Task Scheduler at start-kiosk.bat.
- For twice-daily updates, point Task Scheduler at update-and-restart-kiosk.bat.
- In Task Scheduler, enable "Wake the computer to run this task" if needed.

Logs:
C:\AandD Remake\kiosk-update-log.txt
C:\AandD Remake\kiosk-start-log.txt
