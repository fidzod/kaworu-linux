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

      (nvim-treesitter.withPlugins (p: [
        p.svelte
        p.typescript
        p.html
        p.css
        p.json
        p.markdown
        p.python
        p.nix
        p.lua
        p.bash
      ]))

      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      cmp_luasnip
    ];

    initLua = builtins.readFile ./init.lua;
  };

  xdg.configFile."nvim/lua".source = ./lua;
}
