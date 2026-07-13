--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- Desktop Portal
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

-- Spotify
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

-- Okular
hl.window_rule({
	name = "Okular",
	match = {
		class = "org.kde.okular",
	},
	opacity = "1 override",
})

-- Windows & winboat
hl.window_rule({
	name = "Winboat",
	match = {
		class = "winboat|xfreerdp",
	},
	workspace = 9,
})

-- Virtual Machines
hl.window_rule({
	name = "Virtual machines",
	match = {
		title = ".* on QEMU/KVM",
	},
	workspace = 8,
})

-- Discord
hl.window_rule({
	name = "Discord",
	match = {
		class = "discord",
	},
	workspace = 11,
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
-- Heroic
hl.window_rule({
	name = "Heroic",
	match = {
		class = "heroic",
	},
	workspace = 10,
})
