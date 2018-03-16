@('npm', 'npm.cmd') | ForEach-Object {
	Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {
		param($wordToComplete, $commandAst, $cursorPosition)

		. (Join-Path $PSScriptRoot .\commands.ps1)
		$cmds |
			Where-Object { $_ -like "$wordToComplete*" } |
			Sort-Object |
			ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
			}
	}
}
