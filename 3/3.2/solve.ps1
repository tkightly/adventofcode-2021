$aocinput = Get-Content -Path ./3/3.1/input.txt

# iterate through each in 0..x

function Get-Rating {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]$binaries,
        [boolean]$mostpopulous
    )

    # use arraylist because we can remove items from it
    [System.Collections.ArrayList]$binaries = $binaries

    $i = 0
    do {
        $0 = 0
        $1 = 0

        foreach ($binary in $binaries) {
    
            # depending on the input, add to either $1 or $0
            if ($binary[$i] -eq '1') {
                $1++
            }
            else {
                $0++
            }
        }

        if ($True -eq $mostpopulous) {
            [string]$interestedin = $(if ($0 -gt $1) { 0 } else { 1 })
        }
        else {
            [string]$interestedin = $(if ($0 -le $1) { 0 } else { 1 })
        } 
    
        # if the first character doesn't equal the most common, discard it
        [array]$binariesindexarray = $binaries
        foreach ($binary in $binariesindexarray) {
            if ($binary[$i] -ne $interestedin) {
                $binaries.Remove($binary)
            }
        }
        $i++
    }
    # keep doing this until we have only one left
    until ($binaries.count -eq 1)
    
    [convert]::ToInt32($binaries, 2)
}

$Oxygenrating = Get-Rating -binaries $aocinput -mostpopulous $true
$co2rating = Get-Rating -binaries $aocinput -mostpopulous $false


#$epsilon = [convert]::ToInt32($epsilon, 2)
"Oxygen Rating = $oxygenrating"
"CO2 Rating = $co2rating"
"Answer = $([int]$oxygenrating * [int]$co2rating)"