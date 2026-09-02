-- Personal input overrides (ported from pre-Quattro input.conf).
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
    input = {
        -- English + Bulgarian (traditional phonetic); toggle with Left Alt + Space.
        kb_layout = "us,bg",
        kb_variant = ",phonetic",

        kb_options = "compose:caps,grp:alt_space_toggle,altwin:swap_ralt_rwin",

        -- Faster scrolling.
        scroll_factor = 2.0,

        -- Faster keyboard repeat.
        repeat_rate = 40,
        repeat_delay = 600,

        touchpad = {
            -- Slower touchpad scrolling.
            scroll_factor = 0.4,
        },
    },
})

-- App-specific touchpad scroll speeds.
o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })
