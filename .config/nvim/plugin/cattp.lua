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
})
-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-frappe")
