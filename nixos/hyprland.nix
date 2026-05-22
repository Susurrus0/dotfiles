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

    monitor = ,1920x1080@60,auto,1

    # Autostart Services

    # Launch the top status bar automatically on boot
    exec-once = waybar

    # Launch the wallpaper utility
    exec-once = hyprpaper
  '';
}
