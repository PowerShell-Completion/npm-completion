$COMMANDS['uninstall'] = [CommandInfo]::new(
	'uninstall',
	@(
		'-S',
		'--save',
		'-D',
		'--save-dev',
		'-O',
		'--save-optional',
		'--no-save'
	),
	@()
)
