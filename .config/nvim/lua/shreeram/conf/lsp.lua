local lspconfig = require("lspconfig")

require("mason").setup({
  ensure_installed = {
    "black",
    "clang-format",
    "latexindent",
    "prettier",
    "shellcheck",
    "shfmt",
    "tailwindcss",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "bashls",
    "clangd",
    "html",
    "jdtls",
    "kotlin_language_server",
    "lua_ls",
    "tailwindcss",
    "pyright",
    "texlab",
    "tsserver",
  },
})

lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.kotlin_language_server.setup({})
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
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
lspconfig.pyright.setup({})
