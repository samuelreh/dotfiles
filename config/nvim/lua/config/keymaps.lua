-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Splits (matching tmux: | for vertical, - for horizontal)
vim.keymap.set("n", "<C-w>|", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<C-w>-", "<cmd>split<cr>", { desc = "Horizontal split" })
