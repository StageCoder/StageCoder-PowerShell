function Set-Index ([int]$index = 0) {
    [System.Environment]::SetEnvironmentVariable(
        'STAGECODER_PS_INDEX', 
        $index
    )
}