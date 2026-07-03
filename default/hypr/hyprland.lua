-- Append horizon path to load custom modules
package.path = os.getenv("HOME") .. "/dotfiles/horizon/hypr/?.lua;" .. package.path

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "1920x1080@100hz",
    position = "auto",
    scale    = "1",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Load default modular config
require("autostart")
require("looknfeel")
require("animations")
require("input")
require("keybindings")
require("windows")

hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd("~/dotfiles/horizon/scripts/restart-waybar.sh"))
