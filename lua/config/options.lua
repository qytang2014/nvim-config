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

-- -------------------------gtags配置
-- --set tags=./.tags;,.tags
-- opt.cscopetag = true  --使用 cscope 作为 tags 命令
-- opt.cscopeprg = "gtags-cscope" --使用 gtags-cscope 代替 cscope

-- --enable gtags module
-- vim.g.gutentags_modules = ['gtags_cscope']

-- --change focus to quickfix window after search (optional).
-- vim.g.gutentags_plus_switch = 1

-- --gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
-- vim.g.gutentags_project_root = ['.root']

-- --所生成的数据文件的名称
-- vim.g.gutentags_ctags_tagfile = '.tags'

-- vim.g.gutentags_file_list_command = 'find . -type f -name "*.java" -o -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.aidl" -o -name ".cxx" -o -name "*.cc" -o -name "*.C"'

-- --将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
-- vim.g.gutentags_cache_dir = vim.fn(expand('~/.cache/tags'))

-- --配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
-- vim.g.gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
-- vim.g.gutentags_ctags_extra_args += ['--c++-kinds=+px']
-- vim.g.gutentags_ctags_extra_args += ['--c-kinds=+px']

-- --如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
-- vim.g.gutentags_ctags_extra_args += ['--output-format=e-ctags']

-- --禁用 gutentags 自动加载 gtags 数据库的行为
-- --vim.g.gutentags_auto_add_gtags_cscope = 0
-- --------------------------------------------------
vim.g.rainbow_active = 1

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
