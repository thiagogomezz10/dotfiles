-------------------
---- AUTOSTART ----
-------------------
-- Autostart necessary processes
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar & hyprpaper")
  hl.exec_cmd("elephant")
end)

