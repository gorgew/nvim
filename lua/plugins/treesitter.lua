return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                config = function()
                    -- When in diff mode, we want to use the default
                    -- vim text objects c & C instead of the treesitter ones.
                    local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
                    local configs = require("nvim-treesitter.configs")
                    for name, fn in pairs(move) do
                        if name:find("goto") == 1 then
                            move[name] = function(q, ...)
                                if vim.wo.diff then
                                    local config = configs.get_module("textobjects.move")
                                        [name] ---@type table<string,string>
                                    for key, query in pairs(config or {}) do
                                        if q == query and key:find("[%]%[][cC]") then
                                            vim.cmd("normal! " .. key)
                                            return
                                        end
                                    end
                                end
                                return fn(q, ...)
                            end
                        end
                    end
                end,
            },
        },
        cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "go",
                "graphql",
                "html",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "odin",
                "query",
                "regex",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
                "zig",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                move = {
                    enable = true,
                    goto_next_start = { ["]f"] = "@function.outer", ["]x"] = "@class.outer" },
                    goto_next_end = { ["]F"] = "@function.outer", ["]X"] = "@class.outer" },
                    goto_previous_start = { ["[f"] = "@function.outer", ["[x"] = "@class.outer" },
                    goto_previous_end = { ["[F"] = "@function.outer", ["[X"] = "@class.outer" },
                },
            },
        },
        config = function(_, opts)
            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        opts = {},
    },
}
