vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = function(mode, lhs, rhs, opts)
    opts = opts or { noremap = true, silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- Switch tabs with Ctrl+number
for i = 1, 9 do
  map('n', '<C-' .. i .. '>', i .. 'gt')
end

-- frequently used commands
map("n", "<leader>so", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")

-- clear search highlight
map("n", "<leader>nh", ":nohl<CR>")

-- keep visual selection when indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- open terminal in horizontal split
map("n", "<leader>st", ":split | terminal<CR>a")

-- exit terminal mode on esc
map('t', '<Esc>', '<C-\\><C-n>')

-- Move lines up/down
map("n", "<C-Down>", ":m .+1<CR>")
map("n", "<C-Up>", ":m .-2<CR>")
map("i", "<C-Down>", "<Esc>:m .+1<CR>gi")
map("i", "<C-Up>", "<Esc>:m .-2<CR>gi")
map("v", "<C-Down>", ":m '>+1<CR>gv")
map("v", "<C-Up>", ":m '<-2<CR>gv")

-- nvim-tree
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>")
