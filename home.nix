{ config, pkgs, ... }:

{
  home.username = "fidzod";
  home.homeDirectory = "/home/fidzod";

  home.packages = with pkgs; [
    foot
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = ''
      hl.bind("SUPER + Q", hl.dsp.exec_cmd("foot"))
    '';
  };

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
