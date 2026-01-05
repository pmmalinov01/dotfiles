vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/nvim-lua/plenary.nvim",
		version = "master",
	},
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "master",
	},
	{
		src = "https://github.com/pwntester/octo.nvim",
		version = "master",
	},
})

require("octo").setup({
	picker = "telescope",
})

vim.keymap.set("n", "<leader>op", "<CMD>Octo pr list<CR>", { desc = "List GH Pull Req" })
