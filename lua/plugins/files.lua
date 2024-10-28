return { {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    opts = {
        hijack_netrw_behavior = "open_current",
        window = {
            position = "float",
            width = 40,
            mappings = {
                ["h"] = "close_node",
                ["l"] = "open",
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false
            }
        },
        popup_border_style = "rounded",
    },
    keys = {
        -- {
        --     "<C-n>",
        --     function()
        --         require("neo-tree.command").execute({ toggle = true, dir = require("config.util").get_root() })
        --     end,
        --     desc = "Explorer NeoTree (root dir)",
        -- },
        -- {
        --     "<leader>e",
        --     function()
        --         require("neo-tree.command").execute({
        --             -- toggle = true,
        --             dir = vim.loop.cwd(),
        --             reveal = true
        --         })
        --     end,
        --     desc = "Explorer NeoTree (cwd)",
        -- },
    }
},
    -- ---@type LazySpec
    {
        "mikavilpas/yazi.nvim",
        event = "VeryLazy",
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<leader>e",
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>E",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                -- NOTE: this requires a version of yazi that includes
                -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
                '<c-up>',
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        ---@type YaziConfig
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
                show_help = '<f1>',
            },
        },
    }
}
