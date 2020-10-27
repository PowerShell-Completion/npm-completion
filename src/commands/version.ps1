$COMMANDS['version'] = [CommandInfo]::new(
	'version',
	@('--preid'),
	@(
		'major',
		'minor',
		'patch',
		'premajor',
		'preminor',
		'prepatch',
		'prerelease',
		'from-git'
	)
)
