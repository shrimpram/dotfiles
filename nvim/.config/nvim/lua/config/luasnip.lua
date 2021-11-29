local map    = vim.api.nvim_set_keymap

local ls     = require("luasnip")
local s      = ls.s
local sn     = ls.sn
local t      = ls.t
local i      = ls.i
local f      = ls.f
local c      = ls.c
local d      = ls.d
local pi     = ls.parent_indexer
local isn    = require("luasnip.nodes.snippet").ISN
local psn    = require("luasnip.nodes.snippet").PSN
local l      = require'luasnip.extras'.l
local r      = require'luasnip.extras'.rep
local p      = require("luasnip.extras").partial
local types  = require("luasnip.util.types")
local events = require("luasnip.util.events")
local util   = require("luasnip.util.util")

map( 'i', '<Tab>', [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']], {silent=true, expr=true} )
map( 'i', '<S-Tab>', [[<CMD>lua require'luasnip'.jump(-1)<CR>]], {silent=true} )

map( 's', '<Tab>', [[<CMD>lua require('luasnip').jump(1)<CR>]], {silent=true} )
map( 's', '<S-Tab>', [[<CMD>lua require('luasnip').jump(-1)<CR>]], {silent=true} )


map( 'i', '<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']], {silent=true, expr=true} )
map( 's', '<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>']], {silent=true, expr=true} )

map( 'i', '<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>']], {silent=true, expr=true} )
map( 's', '<C-E>', [[luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-E>']], {silent=true, expr=true} )

ls.config.setup({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  region_check_events = "CursorHold",
  delete_check_events = "TextChanged,InsertEnter",
  store_selection_keys = "<Tab>",
})

ls.snippets = {
  asciidoc = {
    s([["]], {
    t([["`]]), i(1), t([[`"]])
    }),
    s([[']], {
    t([['`]]), i(1), t([[`']])
    }),
    s("ul", {
      t("[.underline]#"), i(1), t("#")
    }),
    s("lt", {
      t("[.line-through]#"), i(1), t("#")
    }),
    s("qt", {
      t("[quote, "), i(1), t(", "), i(2), t({"]", "----", ""}),
      i(3),
      t({"", "----", ""}),
      i(0)
    }),
  },
  java = {
    s("sp", {
      t("System.out."),
      c(1, {
        t("print"),
        t("println"),
      }),
      t("("), i(2), t(");")
    }),
  },
  tex = {
    s("em", {
      t("\\emph{"), i(1), t("}"),
    }),
    s("it", {
      t("\\textit{"), i(1), t("}"),
    }),
    s("bf", {
      t("\\textbf{"), i(1), t("}"),
    }),
    s("ul", {
      t("\\uline{"), i(1), t("}"),
    }),
    s("ol", {
      t("\\overline{"), i(1), t("}"),
    }),
    s("rm", {
      t("\\mathrm{"), i(1), t("}"),
    }),
    s("par", {
      t("\\paragraph{"), i(1), t("}"),
    }),
    s({trig = "(s*)ec(%*?)", wordTrig = true, regTrig = true}, {
      f(function(args, snip) return {"\\"..string.rep("sub", string.len(snip.captures[1]) - 1)} end, {}),
      t({"section"}),
      f(function(args, snip) return snip.captures[2] end, {}),
      t("{"), i(1), t({"}", ""}), i(0)
    }),
    s("mi", {
      t("\\( "), i(1), t(" \\)")
    }),
    s("md", {
      t({"\\[", "\t"}),
      i(1),
      t({"", "\\]"})
    }),
    s("sr", {
      t("\\sqrt{"), i(1), t("}")
    }),
    s("^", {
      t("^{"), i(1), t("}")
    }),
    s("_", {
      t("_{"), i(1), t("}")
    }),
    s("/", {
      t("\\frac{"), i(1), t("}"), t("{"), i(2), t("}")
    }),
    s("*", {
      t("\\cdot"),
    }),
    s("->", {
      t("\\rightarrow"),
    }),
    s("<-", {
      t("\\leftarrow"),
    }),
    s("=>", {
      t("\\implies"),
    }),
    s("<=", {
      t("\\impliedby"),
    }),
    s("ali", {
      t({"\\begin{align}", "\t"}),
      i(1),
      t({"", "\\end{align}"})
    }),
    s("enum", {
      t({"\\begin{enumerate}", "\t\\item "}),
      i(1),
      t({"", "\\end{enumerate}"}),
    }),
    s("item", {
      t({"\\begin{itemize}", "\t\\item "}),
      i(1),
      t({"", "\\end{itemize}"}),
    }),
    s("beg", {
      t("\\begin{"), i(1), t({"}", "\t"}),
      i(2),
      t({"", "\\end{"}), r(1), t("}"),
    }),
    -- s({trig = "(.*)ci", wordTrig = true, regTrig = true}, {
      --   f(function(args, snip) return {"\\"..snip.captures[1]} end, {}),
      --   t("cite["), i(1), t("]"), t("{"), i(2), t("}")
      -- }),
      s("ci", {
        t("\\"),
        c(1, {
          t("cite"),
          t("autocite"),
        }),
        t("["), i(2), t("]"), t("{"), i(3), t("}")
      }),
      s("qt", {
        t("\\textquote["), i(1), t("]"), t("["), i(2), t("]"), t("{"), i(3), t("}")
      }),
      s({trig = "qe(%*?)", wordTrig = true, regTrig = true}, {
        t("\\enquote"),
        f(function(args, snip) return snip.captures[1] end, {}),
        t("{"), i(1), t("}")
      }),
    },
  }
