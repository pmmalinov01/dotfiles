local wezterm = require 'wezterm' -- The art is a bit too bright and colorful to be useful as a backdrop for text, so we're going to dim it down to 10% of its normal brightness
local dimmer = { brightness = 0.1 }

return {
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold', italic = true }),
  hide_tab_bar_if_only_one_tab = true,
  font_size = 13,
  line_height = 1.3,
  scrollback_lines = 10000,
  --foreground = 'silver',
  default_cwd = '/home/pavel/Documents',
  color_scheme = 'Catppuccin Macchiato',
  --hide_tab_bar_if2only_one_tab = true,
  default_cursor_style = 'SteadyBlock',
--  window_background_opacity = .9,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  enable_csi_u_key_encoding = true,
  audible_bell = 'Disabled',
  --hide_tab_bar_if_only_one_tab = true,
  use_dead_keys = false,
  enable_tab_bar = false,
  keys = {
    -- Turn off any side effects from pressing CMD-m
    { key = 't', mods = 'CMD', action = wezterm.action.Nop },
    { key = 'f', mods = 'CMD', action = wezterm.action.ToggleFullScreen },
  },

--  background = {
--    {
--      source = { File = "/home/pavel/Downloads/amazing_asiatic_landscape_art-wallpaper-3440x1440.jpg" },
--      opacity = 1
--    }
--  }
}
