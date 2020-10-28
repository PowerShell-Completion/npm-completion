class CommandInfo {
	[string] $Name
	[CommandInfo[]] $SubCommands = @()
	[string[]] $Options = @()
	[string[]] $Values = @()

	CommandInfo([string] $commandName) {
		$this.Name = $commandName
	}
	CommandInfo(
		[string] $commandName,
		[string[]] $options,
		[string[]] $values
	) {
		$this.Name = $commandName
		$this.Options = $options
		$this.Values = $values
	}
}
