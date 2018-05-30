---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version:
schema: 2.0.0
---

# Get-GitLabGroupMember

## SYNOPSIS
{{Fill in the Synopsis}}

## SYNTAX

### All (Default)
```
Get-GitLabGroupMember -GroupID <Int32> [<CommonParameters>]
```

### UserID
```
Get-GitLabGroupMember -GroupID <Int32> [-UserID <Int32>] [<CommonParameters>]
```

### Search
```
Get-GitLabGroupMember -GroupID <Int32> [-Search <Object>] [<CommonParameters>]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -GroupID
{{Fill GroupID Description}}

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Search
Find a user by name or description. Provided pattern has to be at least 3 characters long.

```yaml
Type: String
Parameter Sets: Search
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UserID
{{Fill UserID Description}}

```yaml
Type: Int32
Parameter Sets: UserID
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None


## OUTPUTS

### GitLab.Group.Member


## NOTES

## RELATED LINKS
