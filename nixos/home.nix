{ config, pkgs, ... }:

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
    gnome-usage

    # KDE Applications
    kdePackages.kcalc
    kdePackages.kdevelop
    kdePackages.kolourpaint
    kdePackages.akregator
    kdePackages.kdenlive
    kdePackages.partitionmanager
  ];

}
