$commandInfoPath = "$PSScriptRoot/../lib/classes/CommandInfo.ps1" | Resolve-Path

. $commandInfoPath

# Define commands
Set-Variable -Name COMMANDS -Option Constant -Value ([ordered] @{})

# Assemble all commands
$commandFiles = Get-ChildItem $PSScriptRoot | Where-Object {
	return ($_.Name -ne '__.ps1') -and ($_.Name -like '*.ps1')
}
$commandFiles | ForEach-Object {
	. $_.FullName
}
