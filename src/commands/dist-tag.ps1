$COMMANDS['dist-tag'] = [CommandInfo]::new('dist-tag')
$COMMANDS['dist-tag'].SubCommands = @(
	[CommandInfo]::new('add')
	[CommandInfo]::new('rm')
	[CommandInfo]::new('ls')
)
