{ config, pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    extraConfig = builtins.readFile ./hypridle.conf;
  };
}
