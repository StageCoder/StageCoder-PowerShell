@{
    Path = "StageCoder.psd1"
    OutputDirectory = "..\output\StageCoder"
    Prefix = '.\_PrefixCode.ps1'
    SourceDirectories = 'Private','Public'
    PublicFilter = 'Public\*.ps1'
    VersionedOutputDirectory = $true
    CopyPaths = @('../LICENSE')
}