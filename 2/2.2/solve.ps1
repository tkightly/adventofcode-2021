$aocinput = Get-Content -Path ./2/2.1/input.txt

$location = [PSCustomObject]@{
    x = 0
    y = 0
    z = 0
    depth = 0
}

foreach ($command in $aocinput) {
    $command = [PSCustomObject]@{
        direction = $command.split(' ')[0]
        units     = $command.split(' ')[1]
    }

    switch ($command.direction) {
        'forward' { $location.y = $location.y + $command.units }
        'down' { $location.z = $location.z - $command.units }
        'up' { $location.z = $location.z + $command.units }
    }

    $location.depth = 0 - $location.z
}

$location

"Answer = $($location.depth * $location.y)"