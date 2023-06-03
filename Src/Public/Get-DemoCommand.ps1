function Get-DemoCommand {
    [CmdletBinding()]
    [Alias('d')]
    param (
        [Parameter(Mandatory=$false)]
        [int]$Index,

        [Parameter(Mandatory=$false)]
        [switch]$Passthru
    )

    if($null -eq $Script:Demo) {
        throw 'No demo loaded. Please run Set-Demo first.'
    }

    if ($PSBoundParameters.ContainsKey('index')) {
        $CurrentIndex = $index
    }
    else {
        $CurrentIndex = Get-DemoIndex
    }
    
    if ($Script:Demo.Length -ge $CurrentIndex) {
        if ($Passthru) {
            $Script:Demo[$CurrentIndex]
        }
        $Script:Demo[$CurrentIndex] | Set-Clipboard
    }
    else {
        Set-Clipboard -Value ''
    }
    Set-Index ($CurrentIndex + 1)
}