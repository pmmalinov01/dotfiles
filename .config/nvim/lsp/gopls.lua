return {

	-- Command and arguments to start the server.
	cmd = { "gopls" },

	-- Filetypes to automatically attach to.
	filetypes = { "go", "go.mod", "gowork", "gotmpl" },

	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
		gopls = {
			-- Analysis settings
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				nilness = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,

			-- Completion settings
			usePlaceholders = true, -- Add placeholders for function parameters
			completionDocumentation = true, -- Show documentation in completion
			completeUnimported = true, -- Suggest completions from unimported packages
			deepCompletion = true, -- Enable deep completion (nested fields/methods)
			matcher = "Fuzzy", -- Fuzzy matching for completions

			-- UI/UX improvements
			semanticTokens = true, -- Enable semantic tokens for better highlighting
			codelenses = {
				gc_details = true,
				generate = true,
				regenerate_cgo = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},

			-- Hints
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
