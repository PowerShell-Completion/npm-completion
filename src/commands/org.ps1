$COMMANDS['org'] = [CommandInfo]::new('org')
$COMMANDS['org'].SubCommands = @(
	[CommandInfo]::new('set')
	[CommandInfo]::new('rm')
	[CommandInfo]::new('ls')
)
