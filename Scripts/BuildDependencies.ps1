New-Item -Path './TMP/Modules' -ItemType Directory -Force | Out-Null

@(
    @{
        Name = 'Pester'
        RequiredVersion = '5.4.1'
    }
    @{
        Name = 'PlatyPS'
        RequiredVersion = '0.14.2'
    }
    @{
        Name = 'ModuleBuilder'
        RequiredVersion = '3.0.0'
    }
) | ForEach-Object {
    Save-Module -Path './TMP/Modules' @_
}

