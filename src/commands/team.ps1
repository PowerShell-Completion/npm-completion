$COMMANDS['team'] = [CommandInfo]::new('team')
$COMMANDS['team'].SubCommands = @(
	[CommandInfo]::new('create')
	[CommandInfo]::new('destroy')
	[CommandInfo]::new('add')
	[CommandInfo]::new('rm')
	[CommandInfo]::new('ls')
	[CommandInfo]::new('edit')
)
