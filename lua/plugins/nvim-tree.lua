return {
    {
        'nvim-tree/nvim-tree.lua',
        name = "nvim-tree",
        lazy = false,
        dependenices = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded = 1
            vim.g.loaded_netrwPlugin = 1

            -- empty setup using defaults nvim-tree
            require("nvim-tree").setup {
                filters = {
                    dotfiles = false,
                    custom = {
                        "shortcut-fe",
                        "test",
                        "toolchain",
                        "tools",
                        "pdk",
                        "cts",
                        "development",
                        "developers",
                        "disregard",
                        "sdk",
                        "cts",
                        "out",
                        "external",
                    },
                },
            }
            local function open_nvim_tree(data)
                -- buffer is a [No Name]
                local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
                -- buffer is a directory
                local directory = vim.fn.isdirectory(data.file) == 1
                if not no_name and not directory then
                    return
                end
                -- change to the directory
                if directory then
                    vim.cmd.cd(data.file)
                end

                -- open the tree
                require("nvim-tree.api").tree.open()
            end

            vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
            ----
        end,
        keys = {
            { "<leader>n", "<cmd>NvimTreeFocus<cr>" },
            { "<leader>t", "<cmd>NvimTreeToggle<cr>" },
            { "<leader>r", "<cmd>NvimTreeRefresh<cr>" }
        },
    }
}
