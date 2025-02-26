-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.autochdir = true
-- By default lazy.vim puts everything in the clipboard. Nope.
vim.opt.clipboard = ""

-- Disable relative line numbers
vim.opt.relativenumber = false

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
