local wezterm = require 'wezterm';

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return tab.tab_index + 1 .. ":" .. wezterm.truncate_left(tab.active_pane.title, max_width)
end)

-- wezterm.on("update-right-status", function(window, pane)
--   local date = wezterm.strftime(" %a %b %-d %H:%M ");
--   window:set_right_status(wezterm.format({
--     {Text=" " .. wezterm.hostname() .. date},
--   }));
-- end)

return {
  adjust_window_size_when_changing_font_size =false,
  -- color_scheme = "AtomOneLight",
  -- color_scheme = "CLRS",
  -- color_scheme = "Github",
  -- color_scheme = "iceberg-light",
  -- color_scheme = "Night Owlish Light",
  -- color_scheme = "OneHalfLight",
  color_scheme = "Piatto Light",
  -- color_scheme = "primary",
  -- color_scheme = "Raycast_Light",
  -- color_scheme = "Spring",
  -- color_scheme = "Terminal Basic",
  -- color_scheme = "Tomorrow",
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = "#33888e",
        fg_color = "#e0e0e0",
      },
      inactive_tab = {
        bg_color = "#0b4c74",
        fg_color = "#a0a0a0",
      },
      inactive_tab_hover = {
        bg_color = "#11666e",
        fg_color = "#c0c0c0",
      },
      new_tab = {
        bg_color = "#0b4c74",
        fg_color = "#a0a0a0",
      },
      new_tab_hover = {
        bg_color = "#11666e",
        fg_color = "#c0c0c0",
      },
    },
  },
  default_prog = {"/opt/homebrew/bin/fish", "-l"},
  -- enable_scroll_bar = true,
  font = wezterm.font("FiraCode Nerd Font", {weight=450, stretch="Normal", italic=false}),
  font_size = 13.0,
  -- window_background_opacity = 0.95,
  keys = {
    {key="h", mods="CMD|SHIFT", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="o", mods="CMD", action=wezterm.action{ActivatePaneDirection="Next"}},
    {key="o", mods="CMD|SHIFT", action=wezterm.action{ActivatePaneDirection="Prev"}},
    {key="s", mods="CMD|SHIFT", action="QuickSelect"},
    {key="v", mods="CMD|SHIFT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="z", mods="CMD", action="TogglePaneZoomState"},
    {key="LeftArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    {key="LeftArrow", mods="CMD|SHIFT", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
    {key="RightArrow", mods="CMD|SHIFT", action=wezterm.action{ActivateTabRelative=1}},
    {key="UpArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    {key="DownArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
  },
  scrollback_lines = 10000,
  tab_bar_at_bottom = true,
  tab_max_width = 32,
  use_fancy_tab_bar = true,
  window_decorations = "RESIZE",
  window_frame = {
    font = wezterm.font("FiraCode Nerd Font", {weight="Bold", stretch="Normal", italic=false}),
    font_size = 12.0,
    inactive_titlebar_bg = "#102c3c",
    -- active_titlebar_bg = "#2b2042",
  },
}

-- vim: set expandtab shiftwidth=2:
