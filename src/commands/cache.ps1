$COMMANDS['cache'] = [CommandInfo]::new('cache')
$COMMANDS['cache'].SubCommands = @(
	[CommandInfo]::new('add')
	[CommandInfo]::new('clean')
	[CommandInfo]::new('verify')
)
