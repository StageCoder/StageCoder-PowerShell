---
external help file: StageCoder-help.xml
Module Name: StageCoder
online version:
schema: 2.0.0
---

# Get-DemoCommand

## SYNOPSIS
Get next demo command and put it in clipboard.

## SYNTAX

```
Get-DemoCommand [[-Index] <Int32>] [-Passthru] [<CommonParameters>]
```

## DESCRIPTION
Get next demo command and put it in clipboard. If -Passthru is specified, the command is also returned as a string.
Use this command in a PSReadLineKeyHandler to bind it to a hotkey. 

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-DemoCommand
```

Get next demo command and put it in clipboard.

## PARAMETERS

### -Index
Get a command of specific index. If not specified, the next command is returned.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Passthru
Also output the command as a string.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
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
