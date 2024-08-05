vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({ "n", "x" }, "j", [[v:count ? "j" : "gj"]], { expr = true })
vim.keymap.set({ "n", "x" }, "k", [[v:count ? "k" : "gk"]], { expr = true })

vim.keymap.set("n", "<Leader>w", vim.cmd.write, { desc = "Write buffer" })
vim.keymap.set("n", "<Leader>ww", vim.cmd.write, { desc = "Write buffer" })
vim.keymap.set("n", "<Leader>wq", vim.cmd.wq, { desc = "Write buffer and quit" })

vim.keymap.set("n", "<leader>co", vim.cmd.copen, { desc = "Open quickfixlist" })
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext, { desc = "Go to next error" })
vim.keymap.set("n", "<leader>cp", vim.cmd.cprev, { desc = "Go to prev error" })

vim.keymap.set("i", "<C-l>", "<C-G>u<Esc>[s1z=`]a<C-G>u", { desc = "Correct spelling error" })

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [[<cmd>%y +<cr>]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
