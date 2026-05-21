return {
	cmd = { "golangci-lint-langserver" },
	filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
	root_markers = { "go.mod", "go.work", ".git" },
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--output.json.path",
			"stdout",
			"--show-stats=false",
			"--issues-exit-code=1",
		},
	},
}
