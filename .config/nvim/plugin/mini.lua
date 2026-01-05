vim.pack.add({
	{
		src = "https://github.com/nvim-mini/mini.nvim",
		version = "main",
	},
})

--require("mini").setup({})
require("mini.ai").setup()

-- { ( [ 'foo', "bar", `paz` ])}
