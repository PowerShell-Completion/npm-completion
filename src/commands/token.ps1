$COMMANDS['token'] = [CommandInfo]::new('token')
$COMMANDS['token'].SubCommands = @(
	[CommandInfo]::new(
		'list',
		@('--json', '--parseable'),
		@()
	),
	[CommandInfo]::new(
		'create',
		@('--read-only', '--cidr'),
		@()
	),
	[CommandInfo]::new('revoke')
)
