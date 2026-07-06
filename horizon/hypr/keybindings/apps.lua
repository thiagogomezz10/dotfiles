-- APPS
local terminal = "alacritty"
local fileManager = "thunar"
local browser = "zen-browser"
local music = "launch-or-focus spotify 'flatpak run com.spotify.Client'"

-- Default apps
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("launch-terminal-tmux"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(music))

-- Launch volume control
hl.bind(mainMod .. " + CTRL + M", hl.dsp.exec_cmd("launch-or-focus-tui 'wiremix -v output'"))
