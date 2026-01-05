vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })

require("lint").linters_by_ft = {
	terraform = { "tflint" },
	go = { "golangcilint" },
	bash = { "bash" },
	cfnlint = { "cfn_lint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	desc = "Run linters on file save, read, or leave insert mode",
	group = vim.api.nvim_create_augroup("UserLint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})

local lint_progress = function()
	local linters = require("lint").get_running()
	if #linters == 0 then
		return "󰦕"
	end
	return "󱉶 " .. table.concat(linters, ", ")
end
