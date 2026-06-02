{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "nixos_old_small";
        padding.top = 1;
      };
      display.separator = "  ";
      modules =
        [
          "break"
          "title"
          {
            type = "os";
            key = "os    ";
            keyColor = "red";
          }
          {
            type = "kernel";
            key = "kernel";
            keyColor = "red";
          }
          {
            type = "host";
            format = "{vendor} {family}";
            key = "host  ";
            keyColor = "red";
          }
          {
            type = "packages";
            key = "pkgs  ";
            keyColor = "red";
          }
          {
            type = "uptime";
            format = "{?days}{days}d {?}{hours}h {minutes}m";
            key = "uptime";
            keyColor = "red";
          }
          {
            type = "memory";
            key = "memory";
            keyColor = "red";
          }
          "break"
        ];
    };
  };
}
