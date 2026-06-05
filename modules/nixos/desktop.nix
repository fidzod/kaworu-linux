{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland";
        user = "greeter";
      };
      initial_session = {
        command = "start-hyprland";
        user = "fidzod";
      };
    };
  };
}
