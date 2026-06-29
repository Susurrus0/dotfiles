{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings =
    {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        output = [
          "eDP-1"
          "HDMI-A-1"
        ];
        modules-left = [ "hyprland/workspaces" "wlr/taskbar" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "network" "mpd" "temperature" "battery" "clock" ];
        "hyprland/workspaces" = {
          "format" = "{name}: {icon}";
          "format-icons" = {
              "1" = "";
              "2" = "";
              "3" = "";
              "4" = "";
              "5" = "";
              "active" = "";
              "default" = "";
          };
            "persistent-workspaces" = {
                  "*" = 5; # 5 workspaces by default on every monitor
                  # "HDMI-A-1" = 3; # but only three on HDMI-A-1
            };
        "battery" = {
            "format" = "{capacity}% {icon}";
            "format-icons" = ["" "" "" "" ""];
        };
        "clock" = {
          "interval" = 60;
          "format" = "{:%I:%M %p}";
          };
        };
      };
    # style = " ... ";
    };
  };
}
