let
  cursorTheme = "Bibata-Modern-Classic"; # Or Bibata-Modern-Ice
  cursorSize = 24;
in

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bash.nix
  ];

  home.username = "bruno";
  home.homeDirectory = "/home/bruno";

  # Must match the system stateVersion for compatibility
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  xdg.configFile = {
    "hypr/hyprland.conf".source = ./hyprland.conf;
    "foot/foot.ini".source = ./foot.ini;
  };

  services.swayosd.enable = true;

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
#     Default cursor
#     package = pkgs.hyprcursor;
#     name = "hyprcursor_light";
    package = pkgs.bibata-cursors;
    name = cursorTheme;
    size = cursorSize;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = cursorTheme;
      cursor-size = cursorSize;
    };
  };

  home.packages = with pkgs; [
    tree
    qbittorrent
    keepassxc
    vscodium
    obsidian
    libreoffice
    gimp
    vlc
    obs-studio
    kdiskmark
    retroarch
    baobab
    geany
    yt-dlp
    stress-ng
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.tree-sitter
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.nil # Nix LSP alternative
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.pyright # Python LSP
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.gopls # Go LSP
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.system}.lua-language-server # Lua LSP

    # KDE Applications
    kdePackages.kcalc
    kdePackages.kdevelop
    kdePackages.kolourpaint
    kdePackages.akregator
    kdePackages.kdenlive
    kdePackages.partitionmanager
    kdePackages.dragon
  ];

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Sleep";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
