require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>", "<cmd>NvimTreeToggle<CR>", { desc = "toggle file tree" })

-- <leader>n now opens nnn (was: toggle line number, moved to <leader>ln)
map("n", "<leader>ln", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>n", "<cmd>NnnPicker %:p:h<CR>", { desc = "nnn picker (current dir)" })
map("n", "<leader>N", "<cmd>NnnExplorer<CR>", { desc = "nnn explorer" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
