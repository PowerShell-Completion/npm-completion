$COMMANDS['audit'] = [CommandInfo]::new(
	'audit',
	@(
		'--json',
		'--parseable',
		'--audit-level'
	),
	@()
)
$COMMANDS['audit'].SubCommands = @(
	[CommandInfo]::new(
		'fix',
		@(
			'--force',
			'--package-lock-only',
			'--dry-run'
		),
		@()
	)
)
