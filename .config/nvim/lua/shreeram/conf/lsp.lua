local lspconfig = require("lspconfig")

require("mason").setup {
  ensure_installed = {
    "prettier",
    "stylua"
  }
}

require("mason-lspconfig").setup({
  ensure_installed =  {
    "lua_ls",
    "texlab",
    "tailwindcss",
    "html",
  }
})

lspconfig.lua_ls.setup {}
lspconfig.tailwindcss.setup {}
lspconfig.texlab.setup {}
lspconfig.html.setup {}


local on_attach = function(_, bufnr)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, {})


  -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,)
  -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end
