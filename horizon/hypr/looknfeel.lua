-- GENERAL SECTION
hl.config({
    general = {
        border_size = 2,
        gaps_in = 5,
        gaps_out = 15,

        col = {
            active_border = "#6C97AC"
        },
    }
})

-- DECORATION SECTION
hl.config({
    decoration = {
        active_opacity = 0.97,
        inactive_opacity = 0.9,

        shadow = {
            enabled = true,
            range = 2,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 2,
            passes = 2,
            special = true,
            brightness = 0.60,
            contrast = 0.75,
        },
    }
})
