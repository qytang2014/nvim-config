-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ";"

local opt = vim.opt

opt.completeopt = "menu,menuone,noselect"
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.cursorline = true -- Enable highlighting of the current line
opt.number = true -- Print line number
opt.mouse = "a" -- Enable mouse mode
-- opt.relativenumber = true -- Relative line numbers
opt.ignorecase = true -- Ignore case
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep --color=auto"
--add tab space
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = -1
opt.expandtab = true

opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically

opt.autoread = true
opt.autowrite = true

opt.wildmode = "longest:full,full" -- Command-line completion mode

if vim.fn.has("nvim-0.9.0") == 1 then
    opt.splitkeep = "screen"
    opt.shortmess:append { C = true }
end

vim.g.rainbow_active = 1

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
