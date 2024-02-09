return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>da",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle breakpoint",
      },
      {
        "<leader>dd",
        function()
          require("dap").continue()
        end,
        desc = "Start debugger",
      },
      {
        "<leader>di",
        function()
          require("dap").step_over()
        end,
        desc = "Step over",
      },
      {
        "<leader>do",
        function()
          require("dap").step_into()
        end,
        desc = "Step into",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
      },
    },
  },
}
