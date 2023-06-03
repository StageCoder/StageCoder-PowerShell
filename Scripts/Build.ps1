param(
    [string]
    $Version,

    [switch]
    $PublishArtifact
)

$ProjectRoot = "$PSScriptRoot/.."
$OutPath = "$ProjectRoot/output/StageCoder"
$HelpSourcePath = "$ProjectRoot/Docs/Help"

if([string]::IsNullOrEmpty($Version)) {
    $Version = '0.99.0-PrereleaseDev' 
}

if (Test-Path $OutPath) {
    Remove-Item -Path $OutPath -Force -Recurse
}
Push-Location $ProjectRoot

$null = New-Item -Path $OutPath -ItemType Directory
Build-Module -SemVer $Version

$SemVer, $PreReleaseTag = $Version.Split('-')
New-ExternalHelp -Path $HelpSourcePath -OutputPath "$OutPath/$SemVer/en-US"

if($PublishArtifact) {
    Compress-Archive -Path $OutPath -DestinationPath "$ProjectRoot/StageCoder.zip" -Force
}

Pop-Location