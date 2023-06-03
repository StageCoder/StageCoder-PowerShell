function Reset-Demo {
    [Alias('r')]
    param(
        [int]$Index = 0
    )
    Set-Index $Index
    Clear-Host
}