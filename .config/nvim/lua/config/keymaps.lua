-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Swap ; and :
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-- Remap VIM 0 to first non-blank character
vim.keymap.set("n", "0", "^")

-- allow the . to execute once for each line of a visual selection
vim.keymap.set("v", ".", ":normal.<CR>", { noremap = true })

-- ctrl y to copy to clipboard
vim.keymap.set({ "n", "v" }, "<C-y>", [["+y]])
