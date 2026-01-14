return {
	on_attach = function(_, bufnr)
		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
			vim.diagnostic.enable(false, { bufnr = bufnr })

			vim.defer_fn(function()
				vim.diagnostic.reset(nil, bufnr)
			end, 1000)
		end
	end,
	-- Command and arguments to start the server.
	cmd = { "yaml-language-server", "--stdio" },

	-- Filetypes to automatically attach to.
	filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	root_markers = { ".git" },

	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		{
			redhat = {
				telemetry = {
					enabled = false,
				},
			},
			yaml = {
				format = {
					enable = true,
				},
				schemas = require("schemastore").yaml.schemas(),
				schemaStore = {
					enable = false,
					url = "",
				},
				completion = true,
				hover = true,
				validate = true,
			},
		},
	},
}
