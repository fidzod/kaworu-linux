{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/stylix.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "kaworu";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  console.keyMap = "uk";

  users.users."fidzod" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" "input" ];
    shell = pkgs.bash;
  };

  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable = true;

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [ mesa ];

  services.sysc-greet = {
    enable = true;
    compositor = "hyprland";
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    curl
    git
    wget
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  system.stateVersion = "26.05";

}
