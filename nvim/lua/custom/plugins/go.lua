return {
  "ray-x/go.nvim",
  version = "*",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },

  config = function ()
    require("go").setup {}
  end,
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},

}
