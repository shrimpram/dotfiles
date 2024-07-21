local ft = require("guard.filetype")

-- ft("c"):fmt("clang-format")

ft("css,html,javascript,json,typescript,typescriptreact"):fmt("prettier")

ft("java"):fmt("google-java-format")

ft("lua"):fmt("stylua")

ft("python"):fmt("isort"):append("black")

ft("shell,sh,bash,zsh"):fmt({
  cmd = "shfmt",
  args = {
    "-i=2",
  },
}):lint("shellcheck")

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
