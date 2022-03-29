local opts = { noremap = true, silent = true }

-- Shorted call to remap
local keymap = vim.api.nvim_set_keymap

--Remap LEADER to be <SPACE>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope find_files
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)

-- Telescope live_grep
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)

-- Telescope buffers
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)

-- Telescope help_tags
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)

keymap("n", "<leader>e", ":NvimTreeOpen<cr>", opts)
keymap("n", "<leader>eq", ":NvimTreeClose<cr>", opts)

-- No more Arrow KEys, learn not to use them
keymap("n", "<Up>", "<NOP>", opts)
keymap("n", "<Down>", "<NOP>", opts)
keymap("n", "<Left>", "<NOP>", opts)
keymap("n", "<Right>", "<NOP>", opts)


-- Visial --
-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move text up and down
keymap("v", "<ALT-j>", ":m .+1<CR>==", opts)
keymap("v", "<ALT-k>", ":m .-2<CR>==", opts)


