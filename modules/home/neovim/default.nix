{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [];

    initLua = builtins.readFile ./lua/options.lua;
  };
}
