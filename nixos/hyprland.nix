{ config, pkgs, ... }:

{
  # write shortcuts to /etc/xdg/hypr/hyprland.conf
  environment.etc."xdg/hypr/hyprland.conf".text = ''
    $mainMod = SUPER

    # Basic Launchers
    bind = $mainMod, Q, exec, kitty
    bind = $mainMod, C, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, E, exec, dolphin
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, R, exec, wofi --show drun

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5

    # Volume keys
    binde = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    binde = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bindl = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    bindl = , XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

    # Screen Brightness keys
    binde = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
    binde = , XF86MonBrightnessDown, exec, brightnessctl set 5%-

    # Input Configuration

    input {
        kb_layout = pl
        follow_mouse = 1

        touchpad {
            natural_scroll = true  # Enables inverted, natural 2-finger scrolling
            tap-to-click = true     # Allows tapping the pad to click
        }
    }

    # Windows Aesthetics

    decoration {
        rounding = 10 # value in pixels

        blur {
            enabled = true
            size = 3
            passes = 1
        }
    }

    general {
        gaps_in = 5
        gaps_out = 10
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
    }

    monitor = ,1920x1080@60,auto,1.2

    # Autostart Services

    # Launch the top status bar automatically on boot
    exec-once = waybar

    # Launch the wallpaper utility
    exec-once = hyprpaper
  '';

  # Waybar Layout
  environment.etc."xdg/waybar/config.jsonc".text = ''
    {
      "layer": "top",
      "position": "top",
      "height": 30,
      "spacing": 4,
      "modules-left": ["hyprland/workspaces"],
      "modules-center": ["clock"],
      "modules-right": ["network", "wireplumber", "battery"],

      "hyprland/workspaces": {
        "format": "{name}"
      },
      "clock": {
        "format": "{:%H:%M - %d/%m/%Y}"
      },
      "network": {
        "format-wifi": " {essid} ({signalStrength}%)",
        "format-disconnected": "⚠ Disconnected"
      },
      "wireplumber": {
        "format": " {volume}%",
        "format-muted": " Muted"
      },
      "battery": {
        "format": "{icon} {capacity}%",
        "format-icons": ["", "", "", "", ""]
      }
    }
  '';

  # Waybar Styling Configuration (CSS format)
  environment.etc."xdg/waybar/style.css".text = ''
    * {
      font-family: "Helvetica", "Arial", sans-serif;
      font-size: 13px;
      border: none;
      border-radius: 0;
    }
    window#waybar {
      background-color: rgba(43, 48, 59, 0.85); /* Semitransparent dark slate */
      color: #ffffff;
      transition-property: background-color;
      transition-duration: .5s;
    }
    #workspaces button {
      padding: 0 5px;
      background-color: transparent;
      color: #ffffff;
      border-bottom: 3px solid transparent;
    }
    #workspaces button.active {
      background-color: #64727D;
      border-bottom: 3px solid #ffffff;
    }
    #clock, #network, #wireplumber, #battery {
      padding: 0 10px;
      margin: 0 2px;
      color: #ffffff;
    }
  '';
}
