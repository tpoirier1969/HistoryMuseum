# Kiosk batch files

Use these corrected files for the museum kiosk:

1. `update-and-start-kiosk-fixed.bat`
   - Use for scheduled twice-daily updates.
   - It runs directly from the Git clone at `C:\AandD2025remake\HistoryMuseum`.
   - It closes Edge before updating, skips the Git update if offline, then starts the kiosk.

2. `start-kiosk-fixed.bat`
   - Use for startup-only launch.
   - It starts the local Python server from `C:\AandD2025remake\HistoryMuseum` and opens Edge kiosk mode.

No separate copy/playout folder is used.

Kiosk URL:

```text
http://localhost:8000/arrivals%20and%20departures.html
```
