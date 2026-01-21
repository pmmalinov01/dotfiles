vim.pack.add({
	"https://github.com/qvalentin/helm-ls.nvim",
	"https://github.com/b0o/SchemaStore.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
	-- Fix the binary warning
	fuzzy = { implementation = "lua" },
	-- Keymap preset: 'default', 'super-tab', 'enter', or 'none'
	keymap = { preset = "default" },
	-- Completion behavior
	completion = {
		-- Auto show menu as you type
		menu = { auto_show = true },

		-- Show docs when selecting an item
		documentation = { auto_show = true, auto_show_delay_ms = 500 },

		-- Ghost text preview
		ghost_text = { enabled = true },

		-- Selection behavior
		list = { selection = { preselect = true, auto_insert = false } },
	},
	-- Sources for completions
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	-- Signature help (function parameters)
	signature = { enabled = true },
	-- Snippet engine
	snippets = { preset = "default" }, -- or 'luasnip', 'mini_snippets', 'vsnip'
})
