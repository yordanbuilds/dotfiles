-- Personal input overrides (ported from pre-Quattro input.conf).
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    -- Compose key on Caps Lock.
    kb_options = "compose:caps",

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
