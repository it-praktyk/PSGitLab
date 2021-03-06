---
external help file: PSGitLab-help.xml
online version: 
schema: 2.0.0
---

# Close-GitLabMergeRequest

## SYNOPSIS
Closes your GitLab merge requests.

## SYNTAX

```
Close-GitLabMergeRequest [-ProjectId] <String> [-ID] <String[]> [-Passthru]
```

## DESCRIPTION
Closes your GitLab merge requests.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Close-GitLabMergeRequest -ProjectId 8 -Id 32
```

## PARAMETERS

### -ProjectId
The ID of a project.

```yaml
Type: String
Parameter Sets: (All)
Aliases: project_id

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ID
The ID of the Merge request you'd like to close.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Passthru
Whether to return closed Merge Request object to the pipeline.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

