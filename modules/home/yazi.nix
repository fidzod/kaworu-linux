{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings.preview.image_protocol = "sixel";
  };
}
