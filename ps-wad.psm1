#this file is for functions that are useful or do basic things that PS should have

#returns true if 'match' operator returns true on all array members.
#case sensitivity is toggleable
function Get-MatchAll{
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

#returns true when 'match' operator returns false on all array members
#case sensitivity is toggleable
function Get-MatchNone{
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

#returns true if ANY array members return 'true' from the 'match operator
#case sensitivity is toggleable
function Get-MatchAny{
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