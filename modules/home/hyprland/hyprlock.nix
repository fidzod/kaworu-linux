{ config, pkgs, lib, ... }:

let
  colors = config.lib.stylix.colors;
  fonts = config.stylix.fonts;
in
{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
        no_fade_in = false;
        disable_loading_bar = false;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 300;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 300;
          bezier = "easeOutQuint";
        };
      };

      background = {
        background.blur_passes = 3;
        background.blue_size = 8;
      };

      image = [
        {
          path = toString ./ascii_art.png;
          size = "70";
          position = "0, 80";
          halign = "center";
          valign = "center";
          rounding = 0;
          border_size = 0;
        }
      ];

      "input-field" = lib.mkForce [{
        monitor = "";
        size = "250, 40";
        rounding = -1;
        outline_thickness = 1;
        dots_size = 0.2;
        dots_spacing = 0.2;
        dots_center = true;
        outer_color = "rgba(86, 90, 90, 0.88)";
        inner_color = "rgba(40, 40, 40, 0.88)";
        font_color = "rgb(200, 200, 200)";
        fade_on_empty = false;
        placeholder_text = ''<i><span foreground="##ffffff99"></span></i>'';
        font_family = fonts.monospace.name;
        hide_input = false;
        position = "0, -80";
        halign = "center";
        valign = "center";
      }];

      shape = [
        {
          monitor = "";
          size = "400, 350";
          color = "rgba(${colors.base00}e0)";
          rounding = 8;
          border_size = 1;
          border_color = "rgba(${colors.base06}e0)";
          rotate = 0;
          xray = false;
          position = "0, 0";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = " $USER";
          font_family = fonts.monospace.name;
          color = "rgba(${colors.base05})";
          halign = "center";
          valign = "center";
          position = "0, -30";
        }
      ];
    };
  };
}
