{ config, pkgs, ... }:

{
  home.username = "fidzod";
  home.homeDirectory = "/home/fidzod";

  imports = [
    ./modules/home/hyprland
    ./modules/home/neovim
    ./modules/home/foot.nix
    ./modules/home/bash.nix
  ];

  home.packages = with pkgs; [
    librewolf
  ];

  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
