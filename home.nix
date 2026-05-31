{ config, pkgs, ... }:

{
  home.username = "fidzod";
  home.homeDirectory = "/home/fidzod";

  imports = [
    ./modules/home/hyprland
    ./modules/home/neovim
    ./modules/home/foot.nix
  ];

  home.stateVersion = "26.05";
  programs.home-manager.enable = true;
}
