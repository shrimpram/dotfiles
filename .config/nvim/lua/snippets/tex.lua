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
  s("em", {
    t("\\emph{"),
    i(1),
    t("}"),
  }),
  s("it", {
    t("\\textit{"),
    i(1),
    t("}"),
  }),
  s("bf", {
    t("\\textbf{"),
    i(1),
    t("}"),
  }),
  s("sc", {
    t("\\textsc{"),
    i(1),
    t("}"),
  }),
  s("ul", {
    t("\\ul{"),
    i(1),
    t("}"),
  }),
  s("ol", {
    t("\\overline{"),
    i(1),
    t("}"),
  }),
  s("rm", {
    t("\\mathrm{"),
    i(1),
    t("}"),
  }),
  s("tt", {
    t("\\text{"),
    i(1),
    t("}"),
  }),
  s("par", {
    t("\\paragraph{"),
    i(1),
    t("}"),
  }),
  s({ trig = "(s*)ec(%*?)", wordTrig = true, regTrig = true }, {
    f(function(args, snip)
      return { "\\" .. string.rep("sub", string.len(snip.captures[1]) - 1) }
    end, {}),
    t({ "section" }),
    f(function(args, snip)
      return snip.captures[2]
    end, {}),
    t("{"),
    i(1),
    t({ "}", "" }),
    i(0),
  }),
  s("mi", fmta([[$<>$]], { i(1) })),
  s(
    "md",
    fmta(
      [[
    \[
      <>
    \]
      ]],
      { i(1) }
    )
  ),
  s("sr", {
    t("\\sqrt{"),
    i(1),
    t("}"),
  }),
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
    "enum",
    fmta(
      [[
    \begin{enumerate}
      \item <>
    \end{enumerate}
      ]],
      { i(1) }
    )
  ),
  s(
    "item",
    fmta(
      [[
    \begin{itemize}
      \item <>
    \end{itemize}
      ]],
      { i(1) }
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
  s("ci", {
    t("\\"),
    c(1, {
      t("cite"),
      t("autocite"),
    }),
    t("["),
    i(2),
    t("]"),
    t("{"),
    i(3),
    t("}"),
  }),
  s(
    "te",
    fmta(
      [[
    \textcquote<>{<>}<>{<>}
    ]],
      {
        c(1, {
          {
            t("["),
            i(1),
            t("]"),
          },
          t(""),
        }),
        i(2),
        c(3, {
          {
            t("["),
            i(1),
            t("]"),
          },
          t(""),
        }),
        i(4),
      }
    )
  ),
  s(
    "en",
    fmta(
      [[
    \enquote{<>}
    ]],
      {
        i(1),
      }
    )
  ),
}
