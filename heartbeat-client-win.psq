while($true)
{
    $p1 = [System.Windows.Forms.Cursor]::Position
    Start-Sleep -Seconds 2  # or use a shorter intervall with the -milliseconds parameter
    $p2 = [System.Windows.Forms.Cursor]::Position

    if($p1.X -eq $p2.X -and $p1.Y -eq $p2.Y) {
        echo "mouse didnt move"
    } else {
        $headers = @{
            'Auth' = ''
            'Device' = ''
        }
        Invoke-RestMethod -Uri https://hb.metacinna.bar/api/beat -Method Post -Headers $headers
    }
}
