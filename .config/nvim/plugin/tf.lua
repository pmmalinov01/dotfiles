vim.pack.add({
  {src = "https://github.com/Allaman/tf.nvim",
    version = "main"
  }
})

require("tf").setup({
  ft = "terraform"
})
