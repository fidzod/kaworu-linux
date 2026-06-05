{ config, pkgs, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/desktop.nix
      ../../modules/nixos/audio.nix
      ../../modules/nixos/graphics.nix
      ../../modules/nixos/stylix.nix
      ../../modules/nixos/plymouth.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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
    packages = with pkgs;
      [
        obsidian
        python3
        bun
        pandoc
        tectonic
        gimp
      ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    curl
    git
    wget
  ];

  programs.xwayland.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; # Did you read the comment?
}
