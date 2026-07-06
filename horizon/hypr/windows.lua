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

hl.window_rule({
	-- Fix some dragging issues with XWayland
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

-- Wiremix
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
