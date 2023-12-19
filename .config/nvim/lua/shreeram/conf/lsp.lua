local lspconfig = require("lspconfig")

require("mason").setup({
  ensure_installed = {
    "bash_language_server",
    "prettier",
    "shellcheck",
    "tailwindcss",
    "texlab",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "jdtls",
    "lua_ls",
    "tailwindcss",
    "texlab",
    "tsserver",
  },
})

lspconfig.html.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
lspconfig.tailwindcss.setup({})
lspconfig.texlab.setup({})
lspconfig.tsserver.setup({})
lspconfig.jdtls.setup({})

local on_attach = function(_, bufnr)
  vim.keymap.set("n", "gk", "<cmd>Lspsaga hover_doc")
end

vim.diagnostic.config({ virtual_text = false })
