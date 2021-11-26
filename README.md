# heartbeat-win

This is the Windows client for [Heartbeat](https://github.com/technically-functional/heartbeat). It will ping the central server every minute, as long as the mouse has been moved since last query.

## Usage

1. Installation

Download and run the installation batch script, [`install.bat`](https://github.com/Metacinnabar/heartbeat-win/blob/master/install.bat) anywhere you'd like, preferably like so:
```bash
curl https://raw.githubusercontent.com/Metacinnabar/heartbeat-win/master/install.bat -o %USERPROFILE%\Downloads
# then run %USERPROFILE%\Downloads\install.bat as administrator
```

2. Setup config

Edit the file at `%USERPROFILE%\Documents\heartbeat\client\heartbeat-client-win.ps1` and input your variables like so:
```powershell
$token = "secure heartbeat token here"
$hostname = "https://hb.metacinna.bar"
$device = "amazing-pc"
```

3. Ensure that the client is setup correctly

To be sure your script is working and got a response from the server, check the logs at `%USERPROFILE%\Documents\heartbeat\logs\` and look for the following:
```log
11/26/2021 10:13:20 - Running Heartbeat
1637921600
```
