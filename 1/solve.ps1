$aocinput = Get-Content -Path ./1/input.txt

$previous = 0
$increases = 0

foreach ($item in $aocinput) {
    if ($item -gt $previous) {
        $increases ++
    }
    $previous = $item
}

$increases