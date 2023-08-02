vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "v" }, "j", [[v:count ? "j" : "gj"]], { expr = true })
vim.keymap.set({ "n", "v" }, "k", [[v:count ? "k" : "gk"]], { expr = true })

vim.keymap.set("n", "<Leader>w", vim.cmd.write, { desc = "Write buffer" })
vim.keymap.set("n", "<Leader>ww", vim.cmd.write, { desc = "Write buffer" })
vim.keymap.set("n", "<Leader>wq", vim.cmd.wq, { desc = "Write buffer and quit" })

vim.keymap.set({ "n", "x" }, "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set({ "n", "x" }, "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set({ "n", "x" }, "<C-j>", "<C-w>j", { desc = "Move to below split" })
vim.keymap.set({ "n", "x" }, "<C-k>", "<C-w>k", { desc = "Move to above split" })

-- TODO Use v:count for counted remappings
local resize = require("shreeram.utils").resize
vim.keymap.set({ "n", "x" }, "<M-j>", function()
  resize(false, 3)
end)
vim.keymap.set({ "n", "x" }, "<M-k>", function()
  resize(false, -3)
end)
vim.keymap.set({ "n", "x" }, "<M-l>", function()
  resize(true, 3)
end)
vim.keymap.set({ "n", "x" }, "<M-h>", function()
  resize(true, -3)
end)

vim.keymap.set("n", "<leader>o", vim.cmd.copen, { desc = "Open quickfixlist" })
vim.keymap.set("n", "<leader>n", vim.cmd.cnext, { desc = "Go to next error" })
vim.keymap.set("n", "<leader>p", vim.cmd.cprev, { desc = "Go to prev error" })
