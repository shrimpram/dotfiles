local function spell()
  if vim.o.spell then
    return string.format("SPELL[%s]", string.upper(vim.o.spelllang))
  else
    return ""
  end
end

local function trailing()
  local line_nr = vim.fn.search([[\s$]], "nw")
  if line_nr == 0 then
    return ""
  end

  return string.format("T:%d", line_nr)
end

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode", spell },
    lualine_b = {
      {
        "diff",
        colored = false,
        symbols = {added = "+", modified = "~", removed = "-"},
      }
    },
    lualine_x = { trailing, "encoding", "fileformat", "filetype" },
  },
}
