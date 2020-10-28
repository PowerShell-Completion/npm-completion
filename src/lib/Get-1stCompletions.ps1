<#
.SYNOPSIS
	Get 1st part completions
#>
function Get-1stCompletions([string] $WordToComplete) {
	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = [System.Management.Automation.CompletionResult[]] @()
	$mainCommands = [string[]] $COMMANDS.Keys

	# Suggest commands
	$completions += $mainCommands | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
	}

	return $completions
}
