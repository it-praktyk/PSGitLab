$ModuleName = Split-Path (Resolve-Path "$PSScriptRoot\..\..\" ) -Leaf
$ModuleManifest = Resolve-Path "$PSScriptRoot\..\..\Release\$ModuleName.psd1"

Get-Module $ModuleName | Remove-Module

Import-Module $ModuleManifest

InModuleScope -ModuleName $ModuleName {
    Describe 'GetAccessLevel - by LevelName' {

        Context 'Group Permissions - by LevelName' {
            $Types = @('Group','Project')

            $LevelNames = @{'Guest' = 10;
                            'Reporter' = 20;
                            'Developer' = 30;
                            'Master' = 40;
                            'Owner' = 50}

            ForEach ( $Type in $Types ) {

                ForEach ( $LevelName in $LevelName.Keys ) {

                    It '$LevelName - $Type' {
                        GetAccessLevel -LevelName $LevelName -Type $Type | Should be $LevelNames[$LevelName]
                    }

                    if ( $LevelName -eq 'Owner' ) {

                        if ( $Type -eq 'Group' ) {
                            It 'Owner' {
                                GetAccessLevel -LevelName Owner -Type $Type | Should be 50
                            }

                            It 'Owner do not throw' {
                                { GetAccessLevel -LevelName Owner -Type 'Group' -ErrorAction Stop } | Should not throw
                            }
                        }
                        else {
                            It 'Owner' {
                                { GetAccessLevel -LevelName Owner -Type $Type -ErrorAction Stop } | Should throw 'Projects do not have owner permission set. See https://docs.gitlab.com/ce/api/members.html'
                            }
                        }
                    }
                }

            }

        }

    }
}
Remove-Module $ModuleName