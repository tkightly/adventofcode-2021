$aocinput = Get-Content -Path ./3/3.1/input.txt

# iterate through each in 0..4

[string]$gamma = ""
[string]$epsilon = ""

foreach ($i in 0..($aocinput[0].ToCharArray().Count -1)) {
    $0 = 0
    $1 = 0

    # loop through each input
    foreach ($binary in $aocinput) {
        # depending on the input, add to either $1 or $0
        if ($binary[$i] -eq '1') {
            $1++
        }
        else {
            $0++
        }
    }
    # work out the most common bit and add it to $gamma
    if ($1 -gt $0 ) {
        $gamma = $gamma + '1'
        $epsilon = $epsilon + '0'
    }
    elseif ($0 -gt $1) {
        $gamma = $gamma + '0'
        $epsilon = $epsilon + '1'
    }
    else {
        throw 'neither 1 or 0 is most populous... help me'
    }
    
}

$gamma = [convert]::ToInt32($gamma,2)
$epsilon = [convert]::ToInt32($epsilon,2)
"Gamma = $gamma"
"Epsilon = $epsilon"
"Answer = $([int]$gamma * [int]$epsilon)"