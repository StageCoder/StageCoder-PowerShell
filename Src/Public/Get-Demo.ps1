function Get-Demo {
    [CmdletBinding()]
    param()

    if($null -eq $Script:Demo) {
        throw 'No demo loaded. Please run Set-Demo first.'
    }

    $Script:Demo

}