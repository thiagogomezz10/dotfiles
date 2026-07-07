--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- desktop portal
hl.window_rule({
	name = "gtk-desktop-portal",
	match = {
		class = "xdg-desktop-portal-gtk",
	},
	size = { "1390", "800" },
	center = true,
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

-- Spotify on workspace 7
hl.window_rule({
	name = "Spotify",
	match = {
		class = "spotify",
	},
	workspace = 7,
})

-- Wiremix floating
hl.window_rule({
	name = "Wiremix",
	match = {
		class = "org.horizon.wiremix",
	},
	size = { "800", "600" },
	center = true,
	float = true,
})

-- Okular (no transparency)
hl.window_rule({
	name = "Okular",
	match = {
		class = "org.kde.okular",
	},
	opacity = "1 override",
})

-- GAMES
-- Modrinth app & Minecraft
hl.window_rule({
	name = "Modrinth App",
	match = {
		class = "modrinth-app|Minecraft.*",
	},
	workspace = 10,
})
-- Steam
hl.window_rule({
	name = "Steam",
	match = {
		class = "steam",
	},
	workspace = 10,
})

-- Windows & winboat
hl.window_rule({
	name = "Winboat",
	match = {
		class = "winboat|xfreerdp",
	},
	workspace = 9,
})
