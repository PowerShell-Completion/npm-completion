$COMMANDS['ls'] = [CommandInfo]::new(
	'ls',
	@(
		'--json',
		'--long',
		'--parseable',
		'--global',
		'-g',
		'--depth',
		'--production',
		'--development',
		'--link',
		'--no-unicode'
	),
	@()
)
