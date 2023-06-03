---
external help file: StageCoder-help.xml
Module Name: StageCoder
online version:
schema: 2.0.0
---

# Set-Demo

## SYNOPSIS
Set a list of commands to be executed as part of a demo.

## SYNTAX

```
Set-Demo [[-Demo] <String[]>] [[-Chord] <String>] [[-MinPause] <Int32>] [[-MaxPause] <Int32>]
 [[-Timing] <String>] [<CommonParameters>]
```

## DESCRIPTION
Set a list of commands to be executed as part of a demo. Also lets you set the timing of the demo.

## EXAMPLES

### Example 1
```powershell
PS C:\> Set-Demo -Demo 'Import-Module -Name StageCoder', 'Get-Command -Module StageCoder', 'Get-Help -Name Set-Demo' -Timing Instant -Chord 'Ctrl+d'
```

Set the demo to run three commands with instant timing and the chord Ctrl+d.

## PARAMETERS

### -Chord
Chord to use to trigger each command in the demo. Defaults to Ctrl+d.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: 'Ctrl+d'
Accept pipeline input: False
Accept wildcard characters: False
```

### -Demo
List of commands to execute as part of the demo.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MaxPause
Maximum pause in milliseconds between each character when writing with timed timing. Defaults to 20ms.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 20
Accept pipeline input: False
Accept wildcard characters: False
```

### -MinPause
Minimum pause in milliseconds between each character when writing with timed timing. Defaults to 10ms.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 10
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timing
Set how demo commands will be printed to the terminal. Defaults to Manual where each command is printed when the user presses any key. Timed will print each command with a random delay between each character. Instant will print each command instantly.

```yaml
Type: String
Parameter Sets: (All)
Aliases:
Accepted values: Manual, Timed, Instant

Required: False
Position: 4
Default value: Manual
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
