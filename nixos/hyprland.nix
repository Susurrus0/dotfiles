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

    monitor = ,1920x1080@60,auto,1
  '';
}
