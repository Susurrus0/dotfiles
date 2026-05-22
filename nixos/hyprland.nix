{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mainMod" = "SUPER";

      # Basic Launchers
      bind = [
        "$mainMod, Q, exec, kitty" # Or whatever your preferred terminal emulator is
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, dolphin" # Launches your Plasma file manager
        "$mainMod, V, togglefloating,"
        "$mainMod, R, exec, wofi --show drun" # Application launcher menu

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
      ];

      monitor = ",preferred,auto,1";
    };
  };

  # Essential helper packages specifically for a clean Wayland/Hyprland environment
  home.packages = with pkgs; [
    wofi       # An application launcher menu (similar to Plasma's KRunner)
    waybar     # A highly customizable top status bar for Wayland
    hyprpaper  # A simple, fast wallpaper utility designed for Hyprland
  ];
}
