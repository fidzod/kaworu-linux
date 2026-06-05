{ config, pkgs, lib, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  imports = [ ./hyprlock.nix ];

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.lua;
    settings.config = {
      general = {
        "col.active_border" = lib.mkForce {
          colors = [ "rgba(${colors.base04}ff)" "rgba(${colors.base01}ff)" "rgba(${colors.base04}ff)" ];
          angle =  45;
        };
        "col.inactive_border" = lib.mkForce {
          colors = [ "rgba(${colors.base01}ff)" "rgba(${colors.base04}ff)" "rgba(${colors.base01}ff)" ];
          angle = 45;
        };
      };
      decoration.shadow = {
        enabled = true;
        range = 8;
        render_power = 2;
        color = lib.mkForce "rgba(00000088)";
      };
    };
  };
}
