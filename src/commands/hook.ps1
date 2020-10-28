$COMMANDS['hook'] = [CommandInfo]::new('hook')
$COMMANDS['hook'].SubCommands = @(
	[CommandInfo]::new('ls')
	[CommandInfo]::new('add')
	[CommandInfo]::new('update')
	[CommandInfo]::new('rm')
)
