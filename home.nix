{ config, pkgs, ... }:

{
  home.username = "fidzod";
  home.homeDirectory = "/home/fidzod";

  imports = [
    ./modules/home/hyprland
    ./modules/home/waybar
    ./modules/home/neovim
    ./modules/home/foot.nix
    ./modules/home/bash.nix
    ./modules/home/btop.nix
    ./modules/home/fastfetch.nix
  ];

  stylix.targets.waybar.enable = false;

  home.packages = with pkgs; [
    librewolf
    wofi
  ];

  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
