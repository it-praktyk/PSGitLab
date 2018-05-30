Function Get-GitLabGroupMember {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.Group.Member')]
    param(

        [Parameter(Mandatory=$true)]
        [Int]$GroupID,

        [Parameter(ParameterSetName='UserID')]
        [Int]$UserID,

        [Parameter(ParameterSetName='Search')]
        [ValidateScript({ ValidateMinimumLength -StringToValidate $_ })]
        $Search

    )

    $Request = @{
        URI = '/groups'
        Method = 'GET'
    }

    switch ($PSCmdlet.ParameterSetName) {
        All { $Request.URI = "/groups/$GroupID/members"; break; }
        UserID { $Request.URI = "/groups/$GroupID/members/$UserID"; break; }
        Search { $Request.URI = "/groups/$GroupID/members?query=$Search"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group.Member'

}