vim.pack.add({
	{
		src = "https://github.com/catppuccin/nvim",
		version = "main",
	},
})
require("catppuccin").setup({
	background = {
		dark = "mocha",
	},
	-- synced with wezterm/kitty
	transparent_background = true,
	integrations = {
		-- Enable nvim-cmp highlight groups (used for completion kind icons)
		cmp = false,
		blink_cmp = false,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "undercurl" },
				hints = { "undercurl" },
				warnings = { "undercurl" },
				information = { "undercurl" },
			},
		},
	},
})
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-frappe")
