-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- XWayland apps (Steam, GTK3 X11 apps) aren't scaled by Hyprland (force_zero_scaling),
-- so they scale themselves via GDK_SCALE. Integer only; 2 matches the 5K main mode.
-- Read at app launch only: restart Steam after changing.
local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.25

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })
hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1.25 })

-- ASUS ROG Strix XG27JCG dual mode (RX 580 has no DSC, so 5K tops out at 60Hz):
--   normal mode            -> 5120x2880@60, scale 2
--   Frame Rate Boost (OSD) -> 2560x1440 at the highest refresh offered (240Hz), scale 1 (gaming)
-- The monitor re-plugs with a different mode list when Frame Rate Boost is toggled,
-- so pick the mode from what it currently offers.
local function xg27jcg(monitor)
  if not (monitor and monitor.description and monitor.description:find("XG27JCG", 1, true)) then return end

  local has5k, best = false, nil
  for _, m in ipairs(monitor.available_modes or {}) do
    if m.width == 5120 and m.height == 2880 then has5k = true end
    if m.width == 2560 and m.height == 1440 and (not best or m.refresh_rate > best.refresh_rate) then best = m end
  end

  if has5k then
    hl.monitor({ output = monitor.name, mode = "5120x2880@59.99", position = "auto", scale = 2 })
  elseif best then
    hl.monitor({ output = monitor.name, mode = string.format("2560x1440@%.2f", best.refresh_rate), position = "auto", scale = 1 })
  end
end

local function xg27jcg_all()
  for _, m in ipairs(hl.get_monitors() or {}) do xg27jcg(m) end
end

hl.on("hyprland.start", xg27jcg_all)
hl.on("config.reloaded", xg27jcg_all)
hl.on("monitor.added", function(monitor)
  local name = monitor and monitor.name
  hl.timer(function()
    if name then xg27jcg(hl.get_monitor(name)) end
  end, { type = "oneshot", timeout = 1 })
end)

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
