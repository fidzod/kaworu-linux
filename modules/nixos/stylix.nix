{ config, pkgs, lib, ... }:

{
  stylix = {
    enable = true;
    image = ../../wallpapers/evangelion-dark-purple.jpg;
    polarity = "dark";
    autoEnable = true;
    enableReleaseChecks = false;
  };
}
