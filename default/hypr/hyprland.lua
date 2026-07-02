-- Append the default config location in lua's scope
package.path = os.getenv("HOME") .. "/dotfiles/horizon/hypr/?.lua;" .. package.path

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "1920x1080@100hz",
    position = "auto",
    scale    = "1",
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-------------------------------
----    HORIZON CONFIG     ----
-------------------------------
require("helpers")
require("autostart")
require("looknfeel")
require("animations")
require("input")
require("keybindings")
require("windows")
