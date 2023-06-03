function randompause {
    if($Script:Timing -eq 'Manual') {
        waitforkeypress
    } else {
        $pause = Get-Random -Minimum $Script:MinPause -Maximum $Script:MaxPause
        Start-Sleep -Milliseconds $pause
    }
}

function waitforkeypress {
    param([Switch]$PassThru)
    $key = $host.ui.rawui.readkey("NoEcho,IncludeKeyDown,AllowCtrlC")
    if($key.virtualkeycode -eq 0x11 -or $key.virtualkeycode -eq 0x1B) {
        throw "User cancelled"
    }
    if ($PassThru.IsPresent) {
        Write-Output $key
    }
}

function waitforspecifickeypress {
    param($Keys)
    do {
        $key = waitforkeypress -PassThru
    } while ($key.VirtualKeyCode -notin $Keys)
}