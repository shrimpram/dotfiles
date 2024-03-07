local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  s("mi", fmta([[$<>$]], { i(1) })),
  s(
    "md",
    fmta(
      [[
  $$
  <>
  $$
  ]],
      { i(1) }
    )
  ),
  s("pw", {
    t("^{"),
    i(1),
    t("}"),
  }),
  s("_", {
    t("_{"),
    i(1),
    t("}"),
  }),
  s("/", {
    t("\\frac{"),
    i(1),
    t("}"),
    t("{"),
    i(2),
    t("}"),
  }),
  s("*", {
    t("\\cdot"),
  }),
  s("|", {
    t("\\mid"),
  }),
  s(">>", {
    t("\\rightarrow"),
  }),
  s("<<", {
    t("\\leftarrow"),
  }),
  s("<>", {
    t("\\leftrightarrow"),
  }),
  s("=>", {
    t("\\implies"),
  }),
  s("<=", {
    t("\\impliedby"),
  }),
  s(
    "ali",
    fmta(
      [[
      \begin{aligned}
      <>
      \end{aligned}
      ]],
      {
        i(0)
      }
    )
  ),
  s(
    "beg",
    fmta(
      [[
    \begin{<e>}<>
    <>
    \end{<e>}
      ]],
      {
        -- i(1) is at nodes[1], i(2) at nodes[2].
        e = i(1),
        i(2),
        i(0),
      },
      {
        repeat_duplicates = true,
      }
    )
  ),
}
