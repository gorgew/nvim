return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            require("telescope").setup({
                extensions = {
                    file_browser = {
                        --hijack_netrw = true,
                    },
                },
            })
            require("telescope").load_extension("file_browser")
        end,
        keys = {
            { "<leader>f",  "<cmd>Telescope find_files<cr>",           desc = "Find files" },
            { "<leader>F",  "<cmd>Telescope live_grep<cr>",            desc = "Live grep" },
            --{ "<leader>e", "<cmd>Telescope file_browser<cr>", desc = "Live grep" },
            { "<leader>ld", "<cmd>Telescope diagnostics<cr>",          desc = "LSP Diagnostics" },
            { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "LSP symbols" },
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
}
