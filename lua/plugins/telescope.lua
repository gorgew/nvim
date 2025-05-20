return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
            "nvim-telescope/telescope-frecency.nvim",
        },
        config = function()
            local actions = require("telescope.actions")

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<Esc>"] = require('telescope.actions').close
                        }
                    },
                    layout_strategy = 'flex',
                    -- layout_config = { height = 0.95 },
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    },
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                },

            })
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("live_grep_args")
            require("telescope").load_extension("git_signs")
            require("telescope").load_extension("frecency")
        end,
        keys = {
            { "<leader>j",  "<cmd>Telescope jumplist<cr>",                                              desc = "Jumplist" },
            { "<leader>gh", "<cmd>Telescope git_signs<cr>",                                             desc = "Git hunks" },
            { "<leader>tr", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep args" },
        },
    },
    {
        "radyz/telescope-gitsigns",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-telescope/telescope.nvim",
        }
    }
}
