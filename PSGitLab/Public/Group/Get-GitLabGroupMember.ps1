Function Get-GitLabGroupMember {
    [cmdletbinding(DefaultParameterSetName='All')]
    [OutputType('GitLab.Group.Member')]
    param(

        [Parameter(Mandatory=$true)]
        [Int]$GroupID,

        [Parameter(ParameterSetName='ID')]
        [Int]$UserID,

        [Parameter(ParameterSetName='Search')]
        $Search,

        [Parameter(ParameterSetName='All')]
        [switch]$All
    )

    $Request = @{
        URI = '/groups'
        Method = 'GET'
    }

    if ( $PSBoundParameters.ContainsKey('GroupID') ) {
        $Request.URI = '/groups/{0}/members' -f $GroupID
    }

    if ( $PSBoundParameters.ContainsKey('Search') ) {
        $Request.URI = '/groups/{0}?search={0}' -f $Search
    }

    QueryGitLabAPI -Request $Request -ObjectType 'GitLab.Group'

}