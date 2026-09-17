local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_decorations = 'NONE'
config.enable_tab_bar = false

config.font = wezterm.font 'Iosevka Term'
config.font_size = 12

-- the tab bar / window frame uses its own font
config.window_frame = {
  font = wezterm.font 'Iosevka Term',
  font_size = 12,
}

-- these two default to the main font but have separate sizes
config.char_select_font_size = 12
config.command_palette_font_size = 12

config.color_scheme = 'GruvboxDark'

return config
