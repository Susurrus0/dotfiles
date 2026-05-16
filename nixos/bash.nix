{ config, pkgs, ... }:

let
  flakePath = "~/dotfiles/nixos";
in
{
  programs.bash = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      la = "ls -a";
      ".." = "cd ..";

      nix-rebuild = "sudo nixos-rebuild switch --flake ${flakePath}/#ThinkPad-X280";
      nix-clean = "sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old && nix-collect-garbage -d";
    };
  };
}
