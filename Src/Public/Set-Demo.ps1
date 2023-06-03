function Set-Demo {
    [CmdletBinding(DefaultParameterSetName = 'Manual')]
    param(
        [Parameter(Mandatory, Position = 1)]
        [string[]]$Demo,

        [Parameter(Position = 2)]
        [string]$Chord = 'ctrl+d',

        [Parameter(Position = 3)]
        [ValidateSet('Manual', 'Timed', 'Instant')]
        [string]$Timing = 'Manual',

        [Parameter(Position = 4)]
        [int]$MinPause = 10,

        [Parameter(Position = 5)]
        [int]$MaxPause = 20
    )
    
    if ($Timing -ne 'Timed') {
        if (
            $PSBoundParameters.ContainsKey('MinPause') -or
            $PSBoundParameters.ContainsKey('MaxPause')
        ) {
            throw 'MinPause and MaxPause are only valid when Timing is Timed'
        }
    }
    
    $Script:Timing = $Timing
    $Script:MinPause = $MinPause
    $Script:MaxPause = $MaxPause
    try {
        $setPSReadLineKeyHandlerSplat = @{
            Chord            = $Chord
            BriefDescription = 'InsertDemoCode'
            Description      = "Insert code from clipboard for demo purpose"
            ScriptBlock      = {
                param($key, $arg)
                try {
                    $ErrorActionPreference = 'Stop'
                    $CurrentIndex = Get-DemoIndex
                    Set-Index ($CurrentIndex + 1)
                    randompause
                    [string[]]$Commands = $Script:Demo[$CurrentIndex] -split [System.Environment]::NewLine
                    for ($i = 0; $i -lt $Commands.Count - 1; $i++) {
                        for ($j = 0; $j -lt $Commands[$i].Length; $j++) {
                            [Microsoft.PowerShell.PSConsoleReadLine]::Insert($Commands[$i][$j])
                            randompause
                        }
                        [Microsoft.PowerShell.PSConsoleReadLine]::AddLine()
                    }
                    for ($j = 0; $j -lt $Commands[$i].Length; $j++) {
                        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($Commands[-1][$j])
                        randompause
                    }
                    waitforspecifickeypress -Keys 0x0D
                    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                }
                catch {
                    Set-Index ($CurrentIndex)
                    [Microsoft.PowerShell.PSConsoleReadLine]::CancelLine()
                }
            }
        }
        Get-PSReadLineKeyHandler -Bound | 
            Where-Object { $_.Description -eq $setPSReadLineKeyHandlerSplat.Description } | 
            ForEach-Object { Remove-PSReadLineKeyHandler -Chord $_.Chord }

        Set-PSReadLineKeyHandler @setPSReadLineKeyHandlerSplat
    }
    catch {}
    $Script:Demo = $Demo
    Set-Index
}