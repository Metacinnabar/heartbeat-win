# heartbeat-win

An unofficial Windows client for [Heartbeat](https://github.com/technically-functional/heartbeat). It will ping the central server every minute, as long as the mouse has been moved since last query.

## Usage

1. Installation

Download and run the installation batch script, [`install.bat`](https://github.com/Metacinnabar/heartbeat-win/blob/master/install.bat), anywhere you'd like, preferably like so:
```bash
curl https://raw.githubusercontent.com/Metacinnabar/heartbeat-win/master/install.bat -o %USERPROFILE%\Downloads
# then run %USERPROFILE%\Downloads\install.bat as administrator
```

2. Configuration

Edit the file at `%USERPROFILE%\Documents\heartbeat\client\heartbeat-client-win.ps1` and input your variables like so:
```powershell
$token = "secure heartbeat token here"
$hostname = "https://hb.metacinna.bar"
$device = "amazing-pc"
```

3. Log out and back in

To ensure the script is ran with the correct configuration, log out and back in to trigger the task.

4. Ensure that the client is setup correctly

To be sure your script is working and got a response from the server, check the logs at `%USERPROFILE%\Documents\heartbeat\logs\` and look for the following:
```log
11/26/2021 10:13:20 - Running Heartbeat
1637921600
```

## How it works
The installation script creates a task in task scheduler that runs the powershell script (as a background process) on login. This script then runs forever in a loop, while recording the mouse position, then waiting a minute, and recording again, and then comparing for change. If there was a detected change in the mouse position it will send a post request to the provided host server, updating the beat.
