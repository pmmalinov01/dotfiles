local wezterm = require 'wezterm'

return {
  font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true }),
  font_size = 14,
  default_cwd = "/Users/pavelm/Documents",
  default_prog = { '/opt/homebrew/bin/fish', '-l' },
  color_scheme = 'Afterglow',
  hide_tab_bar_if_only_one_tab = true,
  default_cursor_style = 'SteadyBlock',
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  enable_csi_u_key_encoding = true
}

