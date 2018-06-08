$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\PSGitLab\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

Describe 'Style rules' -Tag StyleRules {

    $files = @(
        Get-ChildItem $projectRoot\* -Include *.ps1,*.psm1, *.psd1
        Get-ChildItem (Join-Path $projectRoot 'PSGitLab') -Include *.ps1,*.psm1, *.psd1, *.xml -Recurse
        Get-ChildItem (Join-Path $projectRoot 'Tests') -Include *.ps1,*.psm1, *.psd1 -Recurse
    )

    It 'Pester source files contain no trailing whitespace' {
        $badLines = @(
            foreach ($file in $files)
            {
                $lines = [System.IO.File]::ReadAllLines($file.FullName)
                $lineCount = $lines.Count

                for ($i = 0; $i -lt $lineCount; $i++)
                {
                    if ($lines[$i] -match '\s+$') {
                        'File: {0}, Line: {1}' -f $file.FullName, ($i + 1)
                    }
                }
            }
        )

        if ($badLines.Count -gt 0)
        {
            throw "The following $($badLines.Count) lines contain trailing whitespace: $([System.Environment]::NewLine)$([System.Environment]::NewLine)$($badLines -join "$([System.Environment]::NewLine)")"
        }
    }
    It 'Spaces are used for indentation in all code files, not tabs' {
        $badLines = @(
            foreach ($file in $files)
            {
                $lines = [System.IO.File]::ReadAllLines($file.FullName)
                $lineCount = $lines.Count

                for ($i = 0; $i -lt $lineCount; $i++)
                {
                    if ($lines[$i] -match '^[  ]*\t|^\t|^\t[  ]*') {
                        'File: {0}, Line: {1}' -f $file.FullName, ($i + 1)
                    }
                }
            }
        )

        if ($badLines.Count -gt 0)
        {
            throw "The following $($badLines.Count) lines start with a tab character: $([System.Environment]::NewLine)$([System.Environment]::NewLine)$($badLines -join "$([System.Environment]::NewLine)")"
        }
    }

    It 'Pester Source Files all end with a newline' {
        $badFiles = @(
            foreach ($file in $files) {
                $string = [System.IO.File]::ReadAllText($file.FullName)
                if ($string.Length -gt 0 -and $string[-1] -ne "`n") {
                    $file.FullName
                }
            }
        )

        if ($badFiles.Count -gt 0) {
            throw "The following files do not end with a newline: $([System.Environment]::NewLine)$([System.Environment]::NewLine)$($badFiles -join "$([System.Environment]::NewLine)")"
        }
    }
}
