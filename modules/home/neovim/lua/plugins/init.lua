require("plugins.tree")
require("plugins.harpoon")
require("plugins.telescope")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")

require('nvim-autopairs').setup()
require('gitsigns').setup()
require('noice').setup()

require("ibl").setup({
  indent = { char = "|" },
  scope = { enabled = false },
})

require("nvim-web-devicons").setup({
  color_icons = false,
})
