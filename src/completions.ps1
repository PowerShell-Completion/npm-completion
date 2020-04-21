@('npm', 'npm.cmd') | ForEach-Object {
	Register-ArgumentCompleter -Native -CommandName $_ -ScriptBlock {		
		param($wordToComplete, $commandAst, $cursorPosition)

		# Search for a file "package.json" in the current directory or parent directories 
		function Get-PackageJsonPath {
			[string]$packageJsonPath=$pwd;
			while ($packageJsonPath.Length -gt 0 -and -not (Test-Path "$packageJsonPath\package.json")) {
				# No package.json found. Look in parent directory next
				$packageJsonPath=Split-Path $packageJsonPath -Parent
			}
			
			return $packageJsonPath
		}

		function Get-PackageJsonScripts {
			param (
				[Parameter(Mandatory=$true, ValueFromPipeline=$true)]
				[string] $packageJsonPath,
				[string] $scriptFilter
			)
			if ($packageJsonPath.Length -gt 0) {
				$packageJson="$packageJsonPath/package.json"
				$packageJsonContent = Get-Content $packageJson | ConvertFrom-Json
				# Do we have a "script" section?
				if ($packageJsonContent.scripts -ne $null) {
					$allScripts=$packageJsonContent.scripts | Get-Member -MemberType NoteProperty | where Name -like "$scriptFilter" | select -ExpandProperty Name
					$result=$allScripts | ForEach-Object {
						# return the script name and the script text. The script text is passed as tooltip later.
						[tuple]::Create($_, $packageJsonContent.scripts.$_)
					}

					return $result
				}
			}

			return @();
		}

		if ($commandAst.ToString() -match "npm(.cmd)?\s+run(-script)?\s*") {
			$allScripts = Get-PackageJsonPath | Get-PackageJsonScripts -scriptFilter "$wordToComplete*"
			$result=$allScripts | ForEach-Object {
				# item1 is the script name, item2 is the script text (passed as tooltip)
				[System.Management.Automation.CompletionResult]::new($_.item1, $_.item1, 'ParameterValue', $_.item2)
			}

			return $result;
		}

		. $PSScriptRoot\commands.ps1
		$cmds |
			Where-Object { $_ -like "$wordToComplete*" } |
			Sort-Object |
			ForEach-Object {
				[System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
			}
	}
}
