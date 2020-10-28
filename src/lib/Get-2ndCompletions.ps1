<#
.SYNOPSIS
	Get 2nd part completions
#>
function Get-2ndCompletions([string] $WordToComplete, [string] $1stPart) {
	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = [System.Management.Automation.CompletionResult[]] @()
	$commandInfo = $COMMANDS[$1stPart]
	$subCommands = $commandInfo.SubCommands | ForEach-Object {
		return $_.Name
	}
	$options = $commandInfo.Options
	$values = $commandInfo.Values

	# Suggest sub commands
	$completions += $subCommands | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'Command', $_)
	}

	# Suggest options
	$completions += $options | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	# Suggest values
	$completions += $values | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'Keyword', $_)
	}

	return $completions
}
