$srcCommandPath = Join-Path $PSScriptRoot '../resources/commands' -Resolve
$destCommandPath = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '../src/commands.ps1'))

$rawCommands = (Get-Content $srcCommandPath | Out-String).Trim()
$commands = $rawCommands -split '\r\n|\n' | ForEach-Object { $_.Trim() }
$commandsStr = ($commands | ForEach-Object { "`t'$_'" }) -join ",`n"
$commandsScriptContent = "`$cmds = @(`n$commandsStr`n)"

$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllText($destCommandPath, $commandsScriptContent, $utf8NoBomEncoding)
