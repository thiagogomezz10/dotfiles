-- MEDIA
-- Volume & brightness control
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
-- Toggle audio sink
hl.bind("F8", hl.dsp.exec_cmd("toggle-audio-sink"))

-- Playerctl binds
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("swayosd-client --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("swayosd-client --playerctl previous"), { locked = true })

-- Screenshots
hl.bind("PRINT", hl.dsp.exec_cmd("grimblast --notify copysave area"))
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("grimblast --notify copysave"))
