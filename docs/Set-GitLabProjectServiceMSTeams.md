---
external help file: PSGitLab-help.xml
Module Name: PSGitLab
online version: 
schema: 2.0.0
---

# Set-GitLabProjectServiceMSTeams

## SYNOPSIS
Set and adding the Teams service for a project. 

## SYNTAX

```
Set-GitLabProjectServiceMSTeams [-Id <String>] [-Namespace <String>] -webhook <String>
```

## DESCRIPTION
Set and adding the Teams service for a project. 

## EXAMPLES

### Example 1
```
PS C:\> Set-GitLabProjectServiceMSTeams -Id 12 -Webhook 'http://example.hook'
```

Add the Example webhook to project 12. 

## PARAMETERS

### -Id
Project ID

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Namespace
Name of the project in namespace format.

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -webhook
MSTeams Webhook

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

### None


## OUTPUTS

### GitLab.Project.Service.MSTeams


## NOTES

## RELATED LINKS

