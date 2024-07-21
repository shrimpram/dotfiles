local cmp = require("cmp")
local luasnip = require("luasnip")
local defaults = require("cmp.config.default")()
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "orgmode" },
  },
})

cmp.config.formatting = {
  format = require("tailwindcss-colorizer-cmp").formatter,
}

vim.keymap.set({ "x", "i" }, "<C-e>", "<Plug>luasnip-next-choice")
vim.keymap.set({ "x", "i" }, "<C-y>", "<Plug>luasnip-prev-choice")

-- Necessary config for nvim-autopairs
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
