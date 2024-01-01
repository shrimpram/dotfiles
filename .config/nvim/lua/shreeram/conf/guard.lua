local ft = require("guard.filetype")

-- ft("c"):fmt("clang-format")

ft("typescript,javascript,typescriptreact"):fmt("prettier")

ft("java"):fmt("google-java-format")

ft("lua"):fmt("stylua")

ft("tex"):fmt({
  cmd = "latexindent",
  stdin = true,
  args = {
    "-m",
    "-",
  },
})

-- Call setup() LAST!
require("guard").setup({
  -- the only options for the setup function
  fmt_on_save = true,
  -- Use lsp if no formatter was defined for this filetype
  lsp_as_default_formatter = false,
})
