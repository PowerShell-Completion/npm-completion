@('npm', 'npm.cmd') | ForEach-Object {
	Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {
		param($wordToComplete, $commandAst, $cursorPosition)

		. "$PSScriptRoot/commands/__.ps1"
		. "$PSScriptRoot/lib/__.ps1"
		. "$PSScriptRoot/utils.ps1"

		$completions = [System.Management.Automation.CompletionResult[]] @()
		$1stPart = Get-1stPart $commandAst;
		$2ndPart = Get-2ndPart $commandAst;
		$3rdPart = Get-3rdPart $commandAst;

		if (Compare-CommandElement $1stPart $wordToComplete) {
			$completions += Get-1stCompletions $wordToComplete
		}
		elseif (Compare-CommandElement $2ndPart $wordToComplete) {
			$completions += Get-2ndCompletions $wordToComplete $1stPart
		}
		elseif (Compare-CommandElement $3rdPart $wordToComplete) {
			$completions += Get-3rdCompletions $wordToComplete $1stPart $2ndPart
		}

		return $completions
	}
}
