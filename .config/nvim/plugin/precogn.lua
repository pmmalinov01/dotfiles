vim.pack.add({
  "https://github.com/tris203/precognition.nvim",
  "https://github.com/m4xshen/hardtime.nvim",
  "https://github.com/MunifTanjim/nui.nvim"
})

require("precognition").setup({})
require("hardtime").setup({})
--require("precognition").toggle()
vim.keymap.set('n', '<leader>tp', require('precognition').toggle, { desc = 'Toggles movement sugg from precognition' })
