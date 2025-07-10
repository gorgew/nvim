return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                -- your picker configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                layout = {
                    cycle = true,
                    --- Use the default layout or vertical if the window is too narrow
                    -- preset = function()
                    --     return vim.o.columns >= 140 and "default" or "vertical"
                    -- end,
                    preset = "ivy"
                },
                win = {
                    input = {
                        keys = {
                            ["<Esc>"] = { "close", mode = { "n", "i" } }
                        }
                    }
                }
            },
            notifier = {
                timeout = 1500, -- default timeout in ms
                width = { min = 40, max = 0.4 },
                height = { min = 1, max = 0.6 },
                margin = { bottom = 1 },
                padding = false,
                style = "minimal",
                top_down = false
            }
        },
        keys = {
            -- Pickers
            -- Snacks meta
            { "<leader>sp", "<cmd>lua Snacks.picker()<cr>",                        desc = "Snacks pickers" },
            { "<leader>r",  "zz<cmd>lua Snacks.picker.resume()<cr>",               desc = "Last picker" },

            -- Vim
            { "<leader>f",  "zz<cmd>lua Snacks.picker.files()<cr>",                desc = "Find files" },
            { "<leader>F",  "zz<cmd>lua Snacks.picker.grep()<cr>",                 desc = "Live grep" },
            { "<leader>b",  "zz<cmd>lua Snacks.picker.buffers()<cr>",              desc = "Live grep" },

            -- Git
            { "<leader>gf", "zz<cmd>lua Snacks.picker.git_files()<cr>",            desc = "Git status" },
            { "<leader>gs", "zz<cmd>lua Snacks.picker.git_status()<cr>",           desc = "Git status" },

            -- LSP
            { "<leader>ls", "zz<cmd>lua Snacks.picker.lsp_symbols()<cr>",          desc = "LSP symbols" },
            { "<leader>ld", "zz<cmd>lua Snacks.picker.diagnostics_buffer()<cr>",   desc = "LSP Diagnostics" },
            { "gd",         "zz<cmd>lua Snacks.picker.lsp_definitions()<cr>",      desc = "Goto definition" },
            { "gr",         "zz<cmd>lua Snacks.picker.lsp_references()<cr>",       desc = "Goto references" },
            { "gt",         "zz<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", desc = "Goto type" },

        }
    }
}
