using module 'src/lib/classes/CommandInfo.psm1'

# Define commands
Set-Variable -Name COMMANDS -Option Constant -Value ([ordered] @{})

# Assemble all commands
$commandFiles = Get-ChildItem $PSScriptRoot | Where-Object {
	return ($_.Name -ne '__.ps1') -and ($_.Name -like '*.ps1')
}
$commandFiles | ForEach-Object {
	. $_.FullName
}
