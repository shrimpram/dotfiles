return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = { "~/Documents/notes/pages/*", "~/Documents/notes/journals/*" },
      org_default_notes_file = "~/Documents/notes/pages/inbox.org",
      org_todo_keywords = { "TODO", "|", "DONE", "CANCELED" },
      org_capture_templates = {
        t = { description = "Task", template = "* TODO %?\n  %u" },
        j = {
          description = "Journal",
          target = "~/Documents/notes/journals/%<%Y_%m_%d>.org",
        },
      },
    })

    -- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
    -- add `org` to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
