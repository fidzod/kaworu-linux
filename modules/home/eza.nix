{ config, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    icons = "auto";
  };
}
