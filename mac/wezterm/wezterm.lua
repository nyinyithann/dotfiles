-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {
  font = wezterm.font("Monolisa Variable"),
  font_size = 16,
}
-- config.font = wezterm.font_with_fallback {
--     'Monolisa Variable',
--     'FuraMono Nerd Font Mono',
-- }

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- and finally, return the configuration to wezterm
return config
