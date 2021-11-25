@echo off
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    echo.
) else (
    echo Failure: Current permissions inadequate. Please run as administrator.
    pause >nul
    exit
)

set root=%UserProfile%\Documents\heartbeat

echo Creating heartbeat directory at %root%
if not exist %root% mkdir %root%
if not exist %root%\client mkdir %root%\client
if not exist %root%\logs mkdir %root%\logs
echo.

echo Downloading heartbeat client.
curl -o %root%\client\heartbeat-client-win.ps1 https://raw.githubusercontent.com/metacinnabar/heartbeat-wwin/master/heartbeat-client-win.ps1
echo.

echo Creating task in task scheduler
schtasks /CREATE /SC ONSTART /TN heartbeat /TR %root%\client\heartbeat-client-win.ps1
echo.

echo Finished!
pause



