$libPath = $PSScriptRoot | Resolve-Path
$libScripts = Get-ChildItem $libPath | Where-Object {
	return ($_.Name -ne '__.ps1') -and ($_.Name -like '*.ps1')
}
$libScripts | ForEach-Object {
	. $_.FullName
}
