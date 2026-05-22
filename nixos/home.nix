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

}
