-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

-- my coolnight colorscheme
--config.colors = {
--	foreground = "#CBE0F0",
--	background = "#011423",
--	cursor_bg = "#47FF9C",
--	cursor_border = "#47FF9C",
--	cursor_fg = "#011423",
--	selection_bg = "#033259",
--	selection_fg = "#CBE0F0",
--	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
--	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
--}
config.color_schemes = {
	["OLEDppucin"] = custom
}

config.color_scheme = "OLEDppucin"

config.font = wezterm.font("ProFontIIx") -- alternative: MesloLGS Nerd Font Mono
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "NONE" -- "TITLE | RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.initial_rows = 30
config.initial_cols = 90
-- and finally, return the configuration to wezterm
return config
