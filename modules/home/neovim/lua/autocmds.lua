vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    local file = vim.fn.expand("%:p")
    local out = vim.fn.expand("%:p:r") .. ".pdf"
    vim.fn.jobstart({ "pandoc", file, "-o", out, "--pdf-engine=tectonic" })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})
