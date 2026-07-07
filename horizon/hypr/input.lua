-- INPUT SECTION
hl.config({
	input = {
		kb_layout = "us",
		kb_options = "compose:caps, altwin:swap_lalt_lwin",
		-- Change speed of keyboard repeat
		repeat_rate = 40,
		repeat_delay = 250,
	},
})

-- Scroll nicely in the terminal.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
