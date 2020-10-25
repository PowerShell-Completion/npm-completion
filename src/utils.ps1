<#
.SYNOPSIS
	Read `package.json` JSON content.
#>
function Read-PackageJson {
	begin {
		$ErrorActionPreference = 'SilentlyContinue'
	}

	process {
		$cwd = Get-Location
		$packagePath = Join-Path $cwd 'package.json'

		if (-not (Test-Path $packagePath -PathType Leaf)) {
			return $null
		}

		$packagePath = Resolve-Path $packagePath

		return Get-Content $packagePath | ConvertFrom-Json
	}
}

<#
.SYNOPSIS
	Get `package.json` scripts.
#>
function Get-PackageScripts {
	begin {
		$ErrorActionPreference = 'SilentlyContinue'
	}

	process {
		$package = Read-PackageJson

		if ((-not $package) -or (-not $package.scripts)) {
			return $()
		}

		$scripts = $package.scripts | Get-Member -MemberType NoteProperty | ForEach-Object {
			$_.Name
		}

		if (-not $scripts) {
			return [string[]] $()
		}

		return [string[]] $scripts
	}
}

<#
.SYNOPSIS
	Compare command ASTs' command element.
#>
function Compare-CommandElement($a, $b) {
	try {
		return (
			([string]::IsNullOrEmpty($a) -and [string]::IsNullOrEmpty($b)) -or
			($a -eq $b)
		)
	}
	catch {
		return $a -eq $b
	}
}

<#
.SYNOPSIS
	Get 1st part of command AST
#>
function Get-1stPart($commandAst) {
	if (-not ($commandAst -is [System.Management.Automation.Language.CommandAst])) {
		return $null
	}

	if (-not $commandAst.CommandElements[1]) {
		return $null
	}

	return $commandAst.CommandElements[1].Value
}

<#
.SYNOPSIS
	Get 2nd part of command AST
#>
function Get-2ndPart($commandAst) {
	if (-not ($commandAst -is [System.Management.Automation.Language.CommandAst])) {
		return $null
	}

	if (-not $commandAst.CommandElements[2]) {
		return $null
	}

	return $commandAst.CommandElements[2].Value
}

<#
.SYNOPSIS
	Get 3rd part of command AST
#>
function Get-3rdPart($commandAst) {
	if (-not ($commandAst -is [System.Management.Automation.Language.CommandAst])) {
		return $null
	}

	if (-not $commandAst.CommandElements[3]) {
		return $null
	}

	return $commandAst.CommandElements[3].Value
}
