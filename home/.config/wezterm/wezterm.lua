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

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local title = pane.foreground_process_name or pane.title or ''

  local mux_pane = mux.get_pane(pane.pane_id)
  if mux_pane then
    local ok, info = pcall(function()
      return mux_pane:get_foreground_process_info()
    end)
    if ok and info and info.argv and #info.argv > 0 then
      title = table.concat(info.argv, ' ')
    end
  end

  return title
end)

return config
