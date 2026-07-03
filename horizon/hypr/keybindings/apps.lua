-- APPS
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "walker"
local browser = "zen-browser"
music = "flatpak run com.spotify.Client"

-- Default apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))
