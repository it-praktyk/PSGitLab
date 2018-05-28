Function Get-GitLabGroup {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.Group')]
    param(
        [Parameter(Mandatory=$false,ParameterSetName='ID')]
        $GroupID,

        [Parameter(Mandatory=$false,ParameterSetName='Search')]
        $Search
    )

    $Request = @{
        URI = '/groups'
        Method = 'GET'
    }

    if ( $PSBoundParameters.ContainsKey('GroupID') ) {
        $Request.URI = '/groups/{0}' -f $GroupID
    }

    if ( $PSBoundParameters.ContainsKey('Search') ) {
        $Request.URI = '/groups?search={0}' -f $Search
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'

}