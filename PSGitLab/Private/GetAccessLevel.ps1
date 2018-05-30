Function GetAccessLevel {
    [cmdletbinding()]
    param(
        [Parameter(Mandatory = $true,ParameterSetName='ByLevelName')]
        [ValidateSet('Guest', 'Reporter', 'Developer', 'Master', 'Owner')]
        [String]$LevelName,

        [Parameter(Mandatory = $true,ParameterSetName='ByLevelId')]
        [ValidateSet(10,20,30,40,50)]
        [Int]$LevelID,

        [ValidateSet('Project', 'Group')]
        $Type = 'Project'
    )

    if ( $PSCmdlet.ParameterSetName -eq 'ByLevelName') {

        switch ($LevelName) {
            Guest { return 10; break; }
            Reporter { return 20; break; }
            Developer { return 30; break; }
            Master { return 40; break; }
            Owner {
                if ( $Type -eq 'Group' ) {
                    return 50; break;
                }
                else {
                    Write-Error 'Projects do not have owner permission set. See https://docs.gitlab.com/ce/api/members.html'
                }
            }
        }

    }
    else {

        switch ($LevelID) {
            10 { return 'Guest'; break; }
            20 { return 'Reporter'; break; }
            30 { return 'Developer'; break; }
            40 { return 'Master'; break; }
            50 {
                if ( $Type -eq 'Group' ) {
                    return 'Owner'; break;
                }
                else {
                    Write-Error 'Projects do not have level 50 (Owner) permission set. See https://docs.gitlab.com/ce/api/members.html'
                }
            }
        }

    }
}