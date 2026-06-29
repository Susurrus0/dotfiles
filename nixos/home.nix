let
  cursorTheme = "Bibata-Modern-Classic"; # Or Bibata-Modern-Ice
  cursorSize = 24;
in

{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bash.nix
    inputs.catppuccin.homeModules.catppuccin
    ./waybar.nix
  ];

  home.username = "bruno";
  home.homeDirectory = "/home/bruno";

  # Must match the system stateVersion for compatibility
  home.stateVersion = "25.11";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  xdg.configFile = {
    "hypr/hyprland.conf".source = ./hyprland.conf;
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

  catppuccin.flavor = "frappe"; # latte, frappe, macchiato, or mocha
  catppuccin.enable = true;
  catppuccin.autoEnable = true;

  programs.wofi = {
    enable = true;
    settings = {
      width = 500;
      height = 350;
      location = "center";
      show = "drun";
      allow_images = true;
    };

    style = ./wofi-style.css;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono NF:size=16";
        pad = "4x4";
      };

      colors-dark = {
        foreground = "c0caf5";
        background = "1a1b26";

        # Normal/regular colors (color palette 0-7)
        regular0 = "15161E"; # black
        regular1 = "f7768e"; # red
        regular2 = "9ece6a"; # green
        regular3 = "e0af68"; # yellow
        regular4 = "7aa2f7"; # blue
        regular5 = "bb9af7"; # magenta
        regular6 = "7dcfff"; # cyan
        regular7 = "a9b1d6"; # white

        # Bright colors (color palette 8-15)
        bright0 = "414868"; # bright black
        bright1 = "f7768e"; # bright red
        bright2 = "9ece6a"; # bright green
        bright3 = "e0af68"; # bright yellow
        bright4 = "7aa2f7"; # bright blue
        bright5 = "bb9af7"; # bright magenta
        bright6 = "7dcfff"; # bright cyan
        bright7 = "c0caf5"; # bright white

        # dimmed colors
        dim0 = "ff9e64";
        dim1 = "db4b4b";

        alpha = "0.9";
      };
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
    yt-dlp
    stress-ng
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.tree-sitter
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.nil # Nix LSP alternative
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.pyright # Python LSP
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.gopls # Go LSP
    inputs.nixpkgs-unstable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.lua-language-server # Lua LSP
    onlyoffice-desktopeditors
    clementine
    zathura
    imv

    # KDE Applications
    kdePackages.kcalc
    kdePackages.kdevelop
    kdePackages.kolourpaint
    kdePackages.akregator
    kdePackages.kdenlive
    kdePackages.partitionmanager
    kdePackages.dragon
    kdePackages.dolphin
    kdePackages.kate
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 0; # Set to a few seconds if you want a grace period before it locks
      };
      background = [
        {
          path = "screenshot"; # Blurs your current desktop screen as the background
          blur_passes = 3;
          blur_size = 8;
        }
      ];
      input-field = [
        {
          size = "250, 60";
          outline_thickness = 2;
          dots_size = 0.2;
          dots_spacing = 0.2;
          fade_on_empty = false;
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";

        before_sleep_cmd = "pidof hyprlock || hyprlock";
      };

      listener = [
        {
          # automatically lock screen if idle for 5 minutes
          timeout = 300;
          on-timeout = "pidof hyprlock || hyprlock";
        }
      ];
    };
  };

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
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
