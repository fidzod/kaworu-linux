{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  programs.waybar = {
    enable = true;

    style = builtins.replaceStrings
      [ "$base00" "$base01" "$base05" "$base0B" "$base0D" ]
      [ "#${colors.base00}" "#${colors.base01}" "#${colors.base05}" "#${colors.base0B}" "#${colors.base0D}" ]
      (builtins.readFile ./style.css.nix);

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [ "pulseaudio" "network" "battery" "clock" ];

        "hyprland/workspaces" = {
          format = "{id}";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
          };
        };

        "pulseaudio" = {
          "format" = "{icon} {volume}%";
          "format-icons" = {
            "default" = ["" ""];
            "default-muted" = "";
          };
        };

        "clock" = {
          format = "{:%H:%M %d-%m-%Y}";
          tooltip = false;
        };

        "battery" = {
          bat = "BAT0";
          format = "{icon} {capacity}%";
          format-icons = {
              default = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
              charging = ["󰢟" "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰂉" "󰢞" "󰂊" "󰂋" "󰂅"];
          };
        };

        "network" = {
          format-wifi = "󰖩";
          format-disconnected = "󱛅";
        };
      };
    };
  };
}
