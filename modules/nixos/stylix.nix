{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/wallpaper.jpg;
    polarity = "dark";
    autoEnable = true;
    enableReleaseChecks = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-burzum.yaml";

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
