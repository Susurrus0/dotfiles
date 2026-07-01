---@diagnostic disable: undefined-global
-- Monitor Configuration
hl.monitor("", "1920x1080@60", "auto", 1.2)

-- Custom Variables
local terminal = "foot"
local fileManager = "dolphin"
local menu = "wofi --show drun"
local reload_waybar = "pkill waybar; waybar &"
local snip = "snip"
local mainMod = "SUPER"

-- Environment Variables
hl.env("GTK_THEME", "Tokyo-Night-Dark")
hl.env("GTK_ICON_THEME", "Adwaita")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Look and Feel
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg",
          inactive_border = "rgba(595959aa)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 10,
        rounding_power = 2.0,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
            new_optimizations = true,
        },

        shadow = {
            enabled = true,
            range = 8,
            render_power = 2,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = -1,
            disable_hyprland_logo = false,
            disable_watchdog_warning = true,
    },

    input = {
        kb_layout = "pl",
        follow_mouse = 1,
        sensitivity = 0,
        repeat_rate = 35,
        repeat_delay = 200,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
        },
    },

    cursor = {
        inactive_timeout = 30,
        no_hardware_cursors = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- Device-Specific overrides
hl.device("epic-mouse-v1", {
    sensitivity = -0.5,
})

-- Autostart (Triggers on session start)
hl.on("hyprland.start", function()
hl.dsp.exec_cmd("waybar & hyprpaper & swayosd-server &")
end)

-- Animations Configuration
hl.curve("ease", { type = "bezier", points = { {0.25, 0.1}, {0.25, 1.0} } })
hl.animation("windows", 1, 4, "ease")
hl.animation("windowsOut", 1, 4, "default", "popin 80%")
hl.animation("border", 1, 6, "ease")
hl.animation("borderangle", 1, 8, "default")
hl.animation("fade", 1, 4, "ease")
hl.animation("workspaces", 1, 4, "ease")

-- System Keybinds (using native Lua flags)
hl.bind(mainMod, "Return", hl.dsp.exec_cmd, terminal)
hl.bind(mainMod, "Q", hl.dsp.killactive)
hl.bind(mainMod, "M", hl.dsp.exit)
hl.bind(mainMod, "E", hl.dsp.exec_cmd, fileManager)
hl.bind(mainMod, "V", hl.dsp.togglefloating)
hl.bind(mainMod, "D", hl.dsp.exec_cmd, menu)
hl.bind(mainMod, "R", hl.dsp.exec_cmd, reload_waybar)
hl.bind(mainMod, "S", hl.dsp.exec_cmd, snip)

-- Vim Style Window Focus
hl.bind(mainMod, "l", hl.dsp.movefocus, "r")
hl.bind(mainMod, "h", hl.dsp.movefocus, "l")
hl.bind(mainMod, "k", hl.dsp.movefocus, "u")
hl.bind(mainMod, "j", hl.dsp.movefocus, "d")

-- Switch Workspaces
for i = 1, 9 do
    hl.bind(mainMod, tostring(i), hl.dsp.workspace, tostring(i))
    hl.bind(mainMod .. " SHIFT", tostring(i), hl.dsp.movetoworkspace, tostring(i))
end
    hl.bind(mainMod, "0", hl.dsp.workspace, "10")
    hl.bind(mainMod .. " SHIFT", "0", hl.dsp.movetoworkspace, "10")

    -- Mouse Binds (m = mouse dragging flag)
    hl.bind(mainMod, "mouse:272", hl.dsp.movewindow, { flags = "m" })
    hl.bind(mainMod, "mouse:273", hl.dsp.resizewindow, { flags = "m" })
    hl.bind(mainMod, "mouse_down", hl.dsp.workspace, "e+1")
    hl.bind(mainMod, "mouse_up", hl.dsp.workspace, "e-1")

    -- Hardware Keys & Volume (e = repeat, l = locked status)
    hl.bind("", "XF86AudioRaiseVolume", hl.dsp.exec_cmd, "swayosd-client --output-volume raise", { flags = "el" })
    hl.bind("", "XF86AudioLowerVolume", hl.dsp.exec_cmd, "swayosd-client --output-volume lower", { flags = "el" })
    hl.bind("", "XF86MonBrightnessUp", hl.dsp.exec_cmd, "swayosd-client --brightness raise", { flags = "el" })
    hl.bind("", "XF86MonBrightnessDown", hl.dsp.exec_cmd, "swayosd-client --brightness lower", { flags = "el" })

    hl.bind("", "XF86AudioMute", hl.dsp.exec_cmd, "swayosd-client --output-volume mute-toggle", { flags = "l" })
    hl.bind("", "XF86AudioMicMute", hl.dsp.exec_cmd, "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", { flags = "l" })

    hl.bind("", "XF86PowerOff", hl.dsp.exec_cmd, "wlogout --protocol layer-shell", { flags = "l" })
    hl.bind(mainMod .. " SHIFT", "E", hl.dsp.exec_cmd, "wlogout --protocol layer-shell")
