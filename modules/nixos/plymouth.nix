{ config, pkgs, ... }:

{
  boot.plymouth.enable = true;
  boot.kernelParams = [ "quiet" "splash" ];
}
