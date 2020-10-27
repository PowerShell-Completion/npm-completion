$COMMANDS['owner'] = [CommandInfo]::new('owner')
$COMMANDS['owner'].SubCommands = @(
	[CommandInfo]::new('add')
	[CommandInfo]::new('rm')
	[CommandInfo]::new('ls')
)
