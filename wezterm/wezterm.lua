local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'SauceCodePro Nerd Font Mono'
config.font_size = 15
config.color_scheme = 'Zenburn (base16)'

config.colors = {
    background = '#555050',
    tab_bar = {
        active_tab = {
            bg_color = '#707070',
            fg_color  = '#efefef',
        },
        inactive_tab = {
            bg_color = '#101010',
            fg_color   = '#ababab',
        }
    }
}

config.window_frame = {
    font_size = 16,
}

return config
