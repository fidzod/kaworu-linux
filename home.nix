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
    ./modules/home/yazi.nix
    ./modules/home/eza.nix
  ];

  stylix.targets.waybar.enable = false;

  home.packages = with pkgs; [
    wofi
    bat
    fzf
    ripgrep
    librewolf
  ];

  programs.autojump.enable = true;

  home.stateVersion = "26.05";
  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
