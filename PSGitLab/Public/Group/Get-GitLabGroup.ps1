Function Get-GitLabGroup {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.Group')]
    param(
        [Parameter(Mandatory=$false,ParameterSetName='ID')]
        [Alias('Id')]
        $GroupID,

        [Parameter(Mandatory=$false,ParameterSetName='Search')]
        [ValidateScript({ ValidateMinimumLength -StringToValidate $_ })]
        [String]$Search
    )

    $Request = @{
        URI = '/groups'
        Method = 'GET'
    }

    switch ($PSCmdlet.ParameterSetName) {
        All { $Request.URI = '/groups'; break; }
        ID { $Request.URI = "/groups/$GroupID"; break; }
        Search { $Request.URI = "/groups?search=$Search"; break; }
        default { Write-Error "Incorrect parameter set."; break; }
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'

}