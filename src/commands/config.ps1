$COMMANDS['config'] = [CommandInfo]::new('config')
$COMMANDS['config'].SubCommands = @(
	[CommandInfo]::new(
		'set',
		@('-g', '--global'),
		@()
	),
	[CommandInfo]::new('get'),
	[CommandInfo]::new('delete'),
	[CommandInfo]::new(
		'list',
		@('-l', '--json'),
		@()
	),
	[CommandInfo]::new('edit')
)
