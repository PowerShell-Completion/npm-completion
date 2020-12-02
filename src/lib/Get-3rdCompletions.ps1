<#
.SYNOPSIS
	Get 3rd part completions
#>
function Get-3rdCompletions([string] $WordToComplete, [string] $1stPart, [string] $2ndPart) {
	$searchBlock = { $_ -like "$WordToComplete*" }
	$completions = [System.Management.Automation.CompletionResult[]] @()
	$commandInfo = $COMMANDS[$1stPart]
	$subCommands = $commandInfo.SubCommands | Where-Object {
		return $_ -eq $1stPart
	}

	if ($subCommands.Count -eq 0) {
		return [System.Management.Automation.CompletionResult[]] @()
	}

	$subCommand = $subCommands[0]
	$subCommandOptions = $subCommand.Options
	$subCommandValues = $subCommand.Values

	# Suggest options
	$completions += $subCommandOptions | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterName', $_)
	}

	# Suggest values
	$completions += $subCommandValues | Where-Object $searchBlock | ForEach-Object {
		return [System.Management.Automation.CompletionResult]::new($_, $_, 'Keyword', $_)
	}
}
