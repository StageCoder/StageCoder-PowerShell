$ModulePath = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$BuildData = Import-LocalizedData -BaseDirectory $ModulePath -FileName build.psd1

Push-Location -Path $ModulePath -StackName 'DevModuleLoader'

# Dot source all the scripts
$Scripts = Get-ChildItem -Path $BuildData.SourceDirectories -File -Filter '*.ps1' | Select-Object -ExpandProperty FullName
if (-not [string]::IsNullOrWhiteSpace($BuildData.Prefix)) {
	$PrefixPath = Join-Path -Path $PSScriptRoot -ChildPath $BuildData.Prefix
	if (Test-Path -Path $PrefixPath) {
		. $PrefixPath
	}
}
foreach ($Script in $Scripts) {
	. $Script
}
if (-not [string]::IsNullOrWhiteSpace($BuildData.Suffix)) {
	$SuffixPath = Join-Path -Path $PSScriptRoot -ChildPath $BuildData.Suffix
	if (Test-Path -Path $SuffixPath) {
		. $SuffixPath
	}
}

# Find public functions and aliases using AST
$SearchRecursive = $true
$SearchRootOnly = $false
$PublicScriptBlock = [ScriptBlock]::Create('{0}' -f (Get-ChildItem -Path $BuildData.PublicFilter -ErrorAction SilentlyContinue | Get-Content -Raw | Out-String))
$PublicFunctions = $PublicScriptBlock.Ast.FindAll(
	{ $args[0] -is [System.Management.Automation.Language.FunctionDefinitionAst] },
	$SearchRootOnly
).Name
$PublicAlias = $PublicScriptBlock.Ast.FindAll(
	{ $args[0] -is [System.Management.Automation.Language.ParamBlockAst] },
	$SearchRecursive
).Where{ $_.TypeName.FullName -eq 'alias' }.PositionalArguments.Value

$ExportParam = @{}
if ($PublicFunctions) {
	$ExportParam.Add('Function', $PublicFunctions)
}
if ($PublicAlias) {
	$ExportParam.Add('Alias', $PublicAlias)
}
if ($ExportParam.Keys.Count -gt 0) {
	Export-ModuleMember @ExportParam
}

Pop-Location -StackName 'DevModuleLoader'
# import private functions
foreach ($file in (Get-ChildItem "$PSScriptRoot\Private\*.ps1")) {
	try {
		Write-Verbose "Importing $($file.FullName)"
		. $file.FullName
	}
	catch {
		Write-Error "Failed to import '$($file.FullName)'. $_"
	}
}

# import public functions
foreach ($file in (Get-ChildItem "$PSScriptRoot\Public\*.ps1")) {
	try {
		Write-Verbose "Importing $($file.FullName)"
		. $file.FullName
	}
	catch {
		Write-Error "Failed to import '$($file.FullName)'. $_"
	}
}