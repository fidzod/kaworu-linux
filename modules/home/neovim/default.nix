{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nvim-tree-lua
      indent-blankline-nvim
      gitsigns-nvim
      harpoon2
      telescope-nvim
      telescope-fzf-native-nvim
      noice-nvim
      nvim-notify
      nvim-autopairs
      lualine-nvim
      nvim-web-devicons
    ];

    initLua = builtins.readFile ./init.lua;
  };

  xdg.configFile."nvim/lua".source = ./lua;
}
