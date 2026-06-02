local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, capabilities)
    end
  end,
})

vim.lsp.enable({
  "svelte",
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "pyright",
  "marksman",
  "nil_ls"
})

