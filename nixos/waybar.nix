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
        modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
        modules-center = [ "sway/window" ];
        modules-right = [ "battery" "mpd" "temperature" "clock" ];

        "sway/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
      };
    # style = " ... ";
    };
  };
}
