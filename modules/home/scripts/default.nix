{ pkgs, ... }:

{
  home.packages =
    [
      pkgs.grim
      pkgs.slurp

      (pkgs.writeShellScriptBin
        "screenshot" (builtins.readFile ./screenshot.sh))
      (pkgs.writeShellScriptBin
        "screenshot-region" (builtins.readFile ./screenshot_region.sh))
    ];
}
