---@type LazyVimConfig
local M = {}

M.lazy_version = ">=9.1.0"

---@class LazyVimConfig
local defaults = {
    -- icons used by other plugins
    icons = {
        diagnostics = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
        },
        git = {
            added = " ",
            modified = " ",
            removed = " ",
        },
        kinds = {
            Array = " ",
            Boolean = " ",
            Class = " ",
            Color = " ",
            Constant = " ",
            Constructor = " ",
            Enum = " ",
            EnumMember = " ",
            Event = " ",
            Field = " ",
            File = " ",
            Folder = " ",
            Function = " ",
            Interface = " ",
            Key = " ",
            Keyword = " ",
            Method = " ",
            Module = " ",
            Namespace = " ",
            Null = "ﳠ ",
            Number = " ",
            Object = " ",
            Operator = " ",
            Package = " ",
            Property = " ",
            Reference = " ",
            Snippet = " ",
            String = " ",
            Struct = " ",
            Text = " ",
            TypeParameter = " ",
            Unit = " ",
            Value = " ",
            Variable = " ",
        },
    },
}

---@type LazyVimConfig
local options

---@param opts? LazyVimConfig
function M.setup(opts)
    options = vim.tbl_deep_extend("force", defaults, opts or {})
    if not M.has() then
        require("lazy.core.util").error(
            "**LazyVim** needs **lazy.nvim** version "
            .. M.lazy_version
            .. " to work properly.\n"
            .. "Please upgrade **lazy.nvim**",
            { title = "LazyVim" }
        )
        error("Exiting")
    end

    if vim.fn.argc(-1) == 0 then
        -- autocmds and keymaps can wait to load
        vim.api.nvim_create_autocmd("User", {
            group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
            pattern = "VeryLazy",
            callback = function()
                M.load("autocmds")
                M.load("keymaps")
            end,
        })
    else
        -- load them now so they affect the opened buffers
        M.load("autocmds")
        M.load("keymaps")
    end
end

---@param range? string
function M.has(range)
    local Semver = require("lazy.manage.semver")
    return Semver.range(range or M.lazy_version):matches(require("lazy.core.config").version or "0.0.0")
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
    local Util = require("lazy.core.util")
    -- always load lazyvim, then user file
    for _, mod in ipairs({ "config." .. name }) do
        Util.try(function()
            require(mod)
        end, {
            msg = "Failed loading " .. mod,
            on_error = function(msg)
                local modpath = require("lazy.core.cache").find(mod)
                if modpath then
                    Util.error(msg)
                end
            end,
        })
    end
    if vim.bo.filetype == "lazy" then
        -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
        vim.cmd([[do VimResized]])
    end
end

M.did_init = false
function M.init()
    if not M.did_init then
        M.did_init = true
        -- delay notifications till vim.notify was replaced or after 500ms
        require("util").lazy_notify()

        -- load options here, before lazy init while sourcing plugin modules
        -- this is needed to make sure options will be correctly applied
        -- after installing missing plugins
        require("config").load("options")
    end
end

setmetatable(M, {
    __index = function(_, key)
        if options == nil then
            return vim.deepcopy(defaults)[key]
        end
        ---@cast options LazyVimConfig
        return options[key]
    end,
})

return M

