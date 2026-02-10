return {
	cmd = { "gh-actions-language-server", "--stdio" },
	filetypes = { "github-actions-workflow" },
	root_dir = vim.fs.root(0, ".github"),
	single_file_support = true,
	capabilities = {
		workspace = {
			didChangeWorkspaceFolders = {
				dynamicRegistration = true,
			},
		},
	},
	init_options = {
		-- Requires the `repo` and `workflow` scopes
		sessionToken = os.getenv("GITHUB_ACTIONS_LS_TOKEN"),
	},
}
