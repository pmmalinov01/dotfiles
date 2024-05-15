return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {}
    suggestions = {
      enabled = true,
      auto_trigger = true,
    }
    panel = {
      enabled = true,
      auto_refresh = false,
    }
  end,

}
