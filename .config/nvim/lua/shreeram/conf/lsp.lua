local lspconfig = require("lspconfig")

require("mason").setup({
  ensure_installed = {
    "clang-format",
    "prettier",
    "shellcheck",
    "tailwindcss",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "html",
    "jdtls",
    "lua_ls",
    "tailwindcss",
    "texlab",
    "tsserver",
  },
})

lspconfig.clangd.setup({})
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
lspconfig.texlab.setup({
  settings = {
    texlab = {
      diagnostics = {
        ignoredPatterns = { "Undefined reference" },
      },
    },
  },
})
lspconfig.tsserver.setup({})
lspconfig.jdtls.setup({})

local on_attach = function(_, bufnr)
  vim.keymap.set("n", "gk", "<cmd>Lspsaga hover_doc")
end
