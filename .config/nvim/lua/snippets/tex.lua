require("luasnip-boilerplate")

return {
  s({trig = "beg"},
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1),
      }
    )
  ),
  s({trig = "sec"},
    fmta(
      [[\<>section<>{<>}]],
      {
        i(1),
        c(2, {
          t(""),
          t("*"),
        }),
        i(3),
      }
    )
  ),
}
