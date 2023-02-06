-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ";"

local opt = vim.opt

opt.completeopt = "menu,menuone,noselect"
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.cursorline = true -- Enable highlighting of the current line

if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append { C = true }
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
