Import-Module StageCoder

Set-PSReadLineOption -PredictionSource None

$Demo = $(
{
"Hi everyone!"
}
{
"Not everyone knows this, but I'm actually a really bad typist."
}
{
'I have a confession to make.'
}

{
Install-Module StageCoder
}

{
Get-Command -Module StageCoder
}

{
Set-Demo -Demo "'Now I can type'", "'And really fast'" -Chord 'Ctrl+Shift+D' -Timing Instant
}

) | ForEach-Object { $_.ToString().Trim() }

Set-Demo -Demo $Demo -Timing Manual