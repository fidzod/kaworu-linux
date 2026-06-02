local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.wrap = false

opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"
opt.winborder = "rounded"
opt.cursorline = true

opt.splitright = true
opt.splitbelow = true

opt.backspace = "indent,eol,start"

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undo")

opt.sidescrolloff = 8
opt.scrolloff = 8

opt.clipboard = "unnamedplus"
