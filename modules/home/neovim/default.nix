{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [];

    extraLuaConfig = builtins.readFile ./lua/options.lua;
  };
}
