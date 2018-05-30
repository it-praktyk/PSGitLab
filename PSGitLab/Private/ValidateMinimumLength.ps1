Function ValidateMinimumLength {
    [cmdletbinding()]
    Param (
        [Parameter(Mandatory=$true,Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$StringToValidate,
        [Parameter(Mandatory=$false,Position=1)]
        [Int]$MinimumLength=3
    )

        if ( $StringToValidate.Length -ge $MinimumLength ) {
            $true
        }
        else {
            Throw "The provided string has to have at least $MinimumLength characters."
        }

}