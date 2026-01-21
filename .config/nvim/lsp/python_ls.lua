return {

	-- Command and arguments to start the server.
	cmd = { "pylsp" },

	-- Filetypes to automatically attach to.
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },

	-- Settings for pylsp
	-- Install plugins with: pip install python-lsp-server[all] python-lsp-ruff
	-- Or individually: pip install python-lsp-server pylsp-mypy python-lsp-ruff
	settings = {
		pylsp = {
			plugins = {
				-- Completion
				jedi_completion = {
					enabled = true,
					include_params = true, -- Include function parameters in completions
					include_class_objects = true,
					include_function_objects = true,
					fuzzy = true, -- Enable fuzzy matching
					eager = true, -- Resolve completions eagerly for better docs
				},
				jedi_definition = {
					enabled = true,
					follow_imports = true,
					follow_builtin_imports = true,
				},
				jedi_hover = {
					enabled = true,
				},
				jedi_references = {
					enabled = true,
				},
				jedi_signature_help = {
					enabled = true,
				},
				jedi_symbols = {
					enabled = true,
					all_scopes = true,
					include_import_symbols = true,
				},

				-- Linting/Formatting - disable built-in, prefer ruff
				pylint = { enabled = false },
				pyflakes = { enabled = false },
				pycodestyle = { enabled = false },
				mccabe = { enabled = false },
				autopep8 = { enabled = false },
				yapf = { enabled = false },

				-- Use ruff for linting and formatting (if installed)
				ruff = {
					enabled = true,
					formatEnabled = true,
					lineLength = 100,
				},
			},
		},
	},
}
