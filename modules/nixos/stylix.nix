{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evangelion-dark-purple.jpg;
    polarity = "dark";
    autoEnable = true;
    enableReleaseChecks = false;

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sizes = {
        terminal = 10;
        applications = 10;
        desktop = 10;
        popups = 10;
      };
    };
  };
}
