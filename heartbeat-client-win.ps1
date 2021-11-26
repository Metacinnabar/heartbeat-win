# Edit these!!
$token = "secure heartbeat token here"
$hostname = "https://hb.metacinna.bar"
$device = "amazing-pc"

# Setup logging and assembly loading.
$logdate = Get-Date -Format "yyyy-MM-dd-HH-mm"
Start-Transcript -path "$home/Documents/heartbeat/logs/$logdate.log" -append
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 

while ($true)
{
    # Assign the value of the curser to a variable.
    # Wait 60 seconds, and if the value has changed
    # proceed and ping the host.

    $p1 = [System.Windows.Forms.Cursor]::Position
    Start-Sleep -Seconds 60
    $p2 = [System.Windows.Forms.Cursor]::Position

    if ($p1.X -ne $p2.X -or $p1.Y -ne $p2.Y) {
        # Log date and time.
        $date = Get-Date
        echo "$date - Running Heartbeat"

        # Setup auth and device headers.
        $headers = @{
            'Auth' = $token
            'Device' = $device
        }
        # Powershell equivalent of curl.
        Invoke-RestMethod -Uri $hostname/api/beat -Method Post -Headers $headers
    }
}
