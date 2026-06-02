require("nvim-treesitter.config").setup({
  highlight = { enable = true },
  indent = { enable = true },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'svelte',
    'lua',
    'python',
    'javascript',
    'typescript',
    'html',
    'css',
    'python',
    'markdown',
    'nix',
  },
  callback = function() vim.treesitter.start() end,
})
