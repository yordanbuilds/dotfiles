-- Personal keybinding overrides (ported from pre-Quattro bindings.conf).
-- See current bindings: omarchy menu keybindings --print

-- Unbind Omarchy defaults whose keys are repurposed below.
hl.unbind("SUPER + F") -- was: Full screen -> File manager
hl.unbind("SUPER + SHIFT + F") -- was: File manager -> Full screen
hl.unbind("SUPER + G") -- was: Toggle window grouping -> GitHub
hl.unbind("SUPER + S") -- was: Toggle scratchpad -> Screenshot (edit)
hl.unbind("SUPER + SHIFT + S") -- was: Google Maps -> Screenshot (clipboard)
hl.unbind("SUPER + P") -- was: Pseudo window -> PhpStorm
hl.unbind("SUPER + C") -- was: Universal copy -> Calendar
hl.unbind("SUPER + X") -- was: Universal cut -> X
hl.unbind("SUPER + SHIFT + X") -- was: X -> X Post
hl.unbind("SUPER + SHIFT + B") -- was: Browser -> Browser (private)
hl.unbind("SUPER + SHIFT + RETURN") -- was: Browser -> app launcher

-- Applications
o.bind("SUPER + F", "File manager", { omarchy = "nautilus" })
o.bind("SUPER + B", "Browser", { omarchy = "browser" })
o.bind("SUPER + SHIFT + B", "Browser (private)", { omarchy = "browser --private" })
o.bind("SUPER + P", "PhpStorm", { launch = os.getenv("HOME") .. "/.local/share/JetBrains/Toolbox/apps/phpstorm/bin/phpstorm.sh" })
o.bind("SUPER + SHIFT + RETURN", "Launch apps", "walker -p 'Start…'")

-- Web apps
o.bind("SUPER + G", "GitHub", { webapp = "https://github.com" })
o.bind("SUPER + A", "Claude", { webapp = "https://claude.ai" })
o.bind("SUPER + C", "Calendar", { webapp = "https://app.hey.com/calendar/weeks/" })
o.bind("SUPER + E", "Email", { webapp = "https://app.hey.com" })
o.bind("SUPER + Y", "YouTube", { webapp = "https://youtube.com/" })
o.bind("SUPER + X", "X", { webapp = "https://x.com/" })
o.bind("SUPER + SHIFT + X", "X Post", { webapp = "https://x.com/compose/post" })

-- Screenshots (region; edit with satty / straight to clipboard)
o.bind(
  "SUPER + S",
  "Screenshot region (edit)",
  [[bash -c 'F=$(omarchy-capture-screenshot region save) && satty --filename "$F" --output-filename "$F" --actions-on-enter save-to-clipboard --save-after-copy --copy-command wl-copy']]
)
o.bind("SUPER + SHIFT + S", "Screenshot region (clipboard)", "omarchy-capture-screenshot region copy")

-- Workspaces and fullscreen
o.bind("SUPER + Q", "Previous workspace", hl.dsp.focus({ workspace = "previous" }))
o.bind("SUPER + SHIFT + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SHIFT + F11", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
