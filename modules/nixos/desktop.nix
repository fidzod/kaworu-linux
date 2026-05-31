{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.sysc-greet = {
    enable = true;
    compositor = "hyprland";
  };
}
