return {
    -- autosave
    {
        'Pocco81/auto-save.nvim',
        config = true
    },

    -- toogleterm
    {
        'akinsho/toggleterm.nvim',
        name = "toogleterm",
        config = function()
            require("toggleterm").setup {
                shade_terminals = false,
                direction = 'float',
                open_mapping = [[<c-\>]],
            }
            function _G.set_terminal_keymaps()
                local opts = { buffer = 0 }
                vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
                vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
                vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
                vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
                vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            end

            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
        end,
    },

    -- blame-line
    {
        'tveskag/nvim-blame-line',
        keys = {
            { "<leader>b", "<cmd>ToggleBlameLine<cr>" },
        },
    },


    {
        'stevearc/aerial.nvim',
        events = "VeryLazy",
        config = function()
            require("aerial").setup({
                layout = {
                    default_direction = "prefer_right",
                    placement = "window",
                },

                -- A list of all symbols to display. Set to false to display all symbols.
                -- This can be a filetype map (see :help aerial-filetype-map)
                -- To see all available values, see :help SymbolKind
                filter_kind = {
                    "Class",
                    "Constructor",
                    "Field",
                    "Constant",
                    "Enum",
                    "Function",
                    "Interface",
                    "Module",
                    "Method",
                    "Struct",
                },
            })
            vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
        end,
    },

    --gtags
    {
        'ludovicchabant/vim-gutentags',
        lazy = false,
        dependencies = {
            'skywind3000/gutentags_plus'
        },
    },

    --markdown
    {
        "iamcco/markdown-preview.nvim",
        events = "VeryLazy",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    --代码片段运行
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        enabled = false,
    }
}
