return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-live-grep-args.nvim",
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
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
                extensions = {
                    file_browser = {
                        --hijack_netrw = true,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            -- even more opts
                        }
                    }

                },

            })
            require("telescope").load_extension("file_browser")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("live_grep_args")
        end,
        keys = {
            { "<leader>f",  "<cmd>Telescope find_files<cr>",                                            desc = "Find files" },
            { "<leader>F",  "<cmd>Telescope live_grep<cr>",                                             desc = "Live grep" },
            --{ "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "Live grep" },
            { "<leader>ld", "<cmd>Telescope diagnostics<cr>",                                           desc = "LSP Diagnostics" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>",                                  desc = "LSP symbols" },
            { "<leader>b",  "<cmd>Telescope buffers<cr>",                                               desc = "Live grep" },
            { "<leader>gs", "<cmd>Telescope git_status<cr>",                                            desc = "Git status" },
            { "gr",         "<cmd>Telescope lsp_references<cr>",                                        desc = "Git status" },
            { "<leader>tr", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep args" },
        },
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "axkirillov/easypick.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim"
        },
        config = function()
            local easypick = require("easypick")

            -- only required for the example to work
            local get_default_branch = "git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
            local base_branch = vim.fn.system(get_default_branch) or "main"

            easypick.setup({
                pickers = {
                    -- add your custom pickers here
                    -- below you can find some examples of what those can look like

                    -- list files inside current folder with default previewer
                    {
                        -- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
                        name = "ls",
                        -- the command to execute, output has to be a list of plain text entries
                        command = "ls",
                        -- specify your custom previwer, or use one of the easypick.previewers
                        previewer = easypick.previewers.default()
                    },

                    -- diff current branch with base_branch and show files that changed with respective diffs in preview
                    {
                        name = "changed_files",
                        command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
                        previewer = easypick.previewers.branch_diff({ base_branch = base_branch })
                    },

                    -- list files that have conflicts with diffs in preview
                    {
                        name = "conflicts",
                        command = "git diff --name-only --diff-filter=U --relative",
                        previewer = easypick.previewers.file_diff()
                    },
                }
            })
        end
    }
}
