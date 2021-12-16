$aocinput = Get-Content -Path ./2/input.txt

$tracker = @($null, $null, $null)

$increases = -1

$i = 0
$previousmovingvalue = $null
$movingvalue = 0

foreach ($item in $aocinput) {
    $item = [int]$item
    $tracker[$i] = $item

    if ($null -ne $tracker[2]) {
        $previousmovingvalue = $movingvalue
        $movingvalue = $tracker[0] + $tracker[1] + $tracker[2]
        "$movingvalue = $($tracker[0]) + $($tracker[1]) + $($tracker[2])"

        if ($previousmovingvalue -lt $movingvalue) {
            $increases++
        }
    }

    if ($i -eq 2) { $i = 0 }
    else { $i++ }
}

$increases
