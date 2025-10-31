return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    -- NOTE: The log_level is in `opts.opts`
    strategies = {
      -- Change the default chat adapter and model
      chat = {
        adapter = "anthropic",
        model = "claude-sonnet-4-20250514"
      },
      inline = {
        adapter = "anthropic",
      },
    },
    opts = {
      log_level = "DEBUG", -- or "TRACE"
    },
  },
}
