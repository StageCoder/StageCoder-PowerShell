---
external help file: StageCoder-help.xml
Module Name: StageCoder
online version:
schema: 2.0.0
---

# Reset-Demo

## SYNOPSIS
Reset demo index to specified value, defaults to 0.

## SYNTAX

```
Reset-Demo [[-Index] <Int32>] [<CommonParameters>]
```

## DESCRIPTION
Reset demo index to specified value, defaults to 0.

## EXAMPLES

### Example 1
```powershell
PS C:\> Reset-Demo -Index 1
```

Sets the next demo command to be index 1.

## PARAMETERS

### -index
Index to set next demo command to.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
