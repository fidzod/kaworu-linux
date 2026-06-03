hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1,
})

local terminal = "foot"
local bar = "waybar"
local launcher = "wofi --show drun --width 600 --height 300"

hl.on("hyprland.start", function ()
  hl.exec_cmd(bar)
end)

hl.config({
  general = {
    gaps_in  = 5,
    gaps_out = 20,

    border_size = 1,

    resize_on_border = true,

    allow_tearing = true,

    layout = "dwindle",
  },
})

hl.config({
  decoration = {
    rounding = 5,
    rounding_power = 2,
    active_opacity = 0.9,
    inactive_opacity = 0.9,
  },
})

hl.config({
  input = {
    kb_layout = "gb",
    kb_variant = "",
    kb_model = "",
    kb_options = "ctrl:nocaps",
    kb_rules = "",
  }
})

local mod = "SUPER"
local ctrl = "CTRL"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(ctrl .. " + SPACE ", hl.dsp.exec_cmd(launcher))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + C", hl.dsp.exit())
hl.bind(mod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))

hl.bind("Print", hl.dsp.exec_cmd("screenshot"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("screenshot-region"))

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(
  mod .. " + SHIFT + H",
  hl.dsp.window.resize({ x = -10, y = 0, relative = true}),
  { repeating = true }
)
hl.bind(
  mod .. " + SHIFT + L",
  hl.dsp.window.resize({ x = 10,  y = 0, relative = true}),
  { repeating = true }
)
hl.bind(
  mod .. " + SHIFT + K",
  hl.dsp.window.resize({ x =  0,  y = 10, relative = true}),
  { repeating = true }
)
hl.bind(
  mod .. " + SHIFT + J",
  hl.dsp.window.resize({ x =  0,  y = -10, relative = true}),
  { repeating = true }
)

for i = 1, 6 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i}))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
