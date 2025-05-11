-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- -- Use blackhole register for yank
keymap("n", "C", '"_C', opts)
keymap("n", "c", '"_c', opts)
keymap("n", "d", '"_d', opts)
