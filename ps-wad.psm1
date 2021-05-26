function Get-MatchAll{
    <#
    .SYNOPSIS

    Returns $true if match operator returns $true on all members of the array when compared to the input string.

    .DESCRIPTION

    Returns $true if match operator returns $true on all members of the array when compared to the input string.
    Interally runs a match operator against each member of an array. Only if all results are $true, will this function also return $true.
    Optionally enable case sensitivity with the $CaseSensitivity flag.

    .PARAMETER Array

    Input array of strings or whatever you want.

    .PARAMETER String

    Input string to be compared to each member of the array.

    .PARAMETER CaseSensitive

    Boolean. Switches between match and cmatch internally. Defaults to $false.

    .INPUTS

    Don't do this. It's for use in "if" statements primarily.

    .OUTPUTS

    Boolean $true or $false.

    .EXAMPLE

    PS> Get-MatchAll -Array @("Word","Story","Floor") -String "or"
    True
    #>
    param(
        $Array,
        $String,
        [bool]$CaseSensitive = $false
    )

    $match = $true

    foreach($thing in $array)
    {
        if($CaseSensitive)
        {
            if($thing -cnotmatch $string){$match = $false}
        }
        else
        {
            if($thing -notmatch $String){$match = $false}
        }
    }

    return $match
}

function Get-MatchNone{
    <#
    .SYNOPSIS

    Returns $true if match operator returns $false on all members of the array when compared to the input string.

    .DESCRIPTION

    Returns $true if match operator returns $false on all members of the array when compared to the input string.
    Interally runs a match operator against each member of an array. Only if all results are $false, will this function return $true.
    Optionally enable case sensitivity with the $CaseSensitivity flag.

    .PARAMETER Array

    Input array of strings or whatever you want.

    .PARAMETER String

    Input string to be compared to each member of the array.

    .PARAMETER CaseSensitive

    Boolean. Switches between match and cmatch internally. Defaults to $false.

    .INPUTS

    Don't do this. It's for use in "if" statements primarily.

    .OUTPUTS

    Boolean $true or $false.

    .EXAMPLE

    PS> Get-MatchNone -Array @("Word","Story","Floor") -String "an"
    True
    #>
    param(
        $Array,
        $String,
        [bool]$CaseSensitive = $false
    )

    $match = $true

    foreach($thing in $array)
    {
        if($CaseSensitive)
        {
            if($thing -cmatch $String){$match = $false}
        }
        else
        {
            if($thing -match $String){$match = $false}
        }
    }

    return $match
}

function Get-MatchAny{
    <#
    .SYNOPSIS

    Returns $true if match operator returns $true on any members of the array when compared to the input string.

    .DESCRIPTION

    Returns $true if match operator returns $true on any members of the array when compared to the input string.
    Interally runs a match operator against each member of an array. If any of the results are $true, this function will return $true.
    Optionally enable case sensitivity with the $CaseSensitivity flag.

    .PARAMETER Array

    Input array of strings or whatever you want.

    .PARAMETER String

    Input string to be compared to each member of the array.

    .PARAMETER CaseSensitive

    Boolean. Switches between match and cmatch internally. Defaults to $false.

    .INPUTS

    Don't do this. It's for use in "if" statements primarily.

    .OUTPUTS

    Boolean $true or $false.

    .EXAMPLE

    PS> Get-MatchAny -Array @("Word","Story","Floor") -String "sto"
    True
    #>
    param(
        $Array,
        $String,
        [bool]$CaseSensitive = $false
    )

    $match = $false

    foreach($thing in $Array)
    {
        if($CaseSensitive)
        {
            if($thing -cmatch $String){$match = $true}
        }
        else
        {
            if($thing -match $String){$match = $true}
        }
    }

    return $match
}