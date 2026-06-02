require("plugins.tree")
require("plugins.harpoon")
require("plugins.telescope")
require("plugins.lualine")

require("ibl").setup({
  indent = { char = "|" },
  scope = { enabled = false },
})

require('nvim-autopairs').setup()
require('gitsigns').setup()
require('noice').setup()
