$COMMANDS['profile'] = [CommandInfo]::new('profile')
$COMMANDS['profile'].SubCommands = @(
	[CommandInfo]::new(
		'get',
		@('--json', '--parseable'),
		@()
	)
	[CommandInfo]::new(
		'set',
		@('--json', '--parseable'),
		@()
	)
	[CommandInfo]::new(
		'enable-2fa',
		@(),
		@('auth-and-writes', 'auth-only')
	)
	[CommandInfo]::new('disable-2fa')
)
