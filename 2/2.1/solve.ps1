$aocinput = Get-Content -Path ./2/2.1/input.txt

$location = [PSCustomObject]@{
    x     = 0
    y     = 0
    z     = 0
    depth = 0
}

$attitude = [PSCustomObject]@{
    aim = 0
}

foreach ($command in $aocinput) {
    $command = [PSCustomObject]@{
        direction = $command.split(' ')[0]
        units     = $command.split(' ')[1]
    }

    switch ($command.direction) {
        'up' { $attitude.aim = $attitude.aim - $command.units }
        'down' { $attitude.aim = $attitude.aim + $command.units }
        'forward' {
            $location.y = $location.y + $command.units
            $location.depth = $location.depth + ($attitude.aim * $command.units)
        }
    }

    $location.z = 0 - $location.depth
}

$location

"Answer = $($location.depth * $location.y)"