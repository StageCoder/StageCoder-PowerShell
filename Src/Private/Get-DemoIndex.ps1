function Get-DemoIndex {
    [int][System.Environment]::GetEnvironmentVariable(
        'STAGECODER_PS_INDEX'
    ) ?? 0
}