local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = 'Kanagawa (Gogh)'
config.default_domain = 'WSL:Ubuntu-24.04'
config.default_prog = { "wsl" }
config.use_ime = true

config.hide_tab_bar_if_only_one_tab = true

config.harfbuzz_features = { 'calt=0' } -- disable ligatures

return config
