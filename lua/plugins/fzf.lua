return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                fzf_opts = { ['--layout'] = 'default' }
            })
        end,
        keys = {
            { "<leader>f",  "<cmd>FzfLua files git_icons=false<cr>",                                               desc = "Find files" },
            { "<leader>F",  "<cmd>FzfLua live_grep_native<cr>",                                                    desc = "Live grep" },
            { "<leader>gs", "<cmd>FzfLua git_status<cr>",                                                          desc = "Git status" },
            { "<leader>b",  "<cmd>FzfLua buffers<cr>",                                                             desc = "Live grep" },
            { "<leader>r",  "<cmd>FzfLua resume<cr>",                                                              desc = "Last FZF search" },
            { "<leader>ls", "<cmd>FzfLua lsp_document_symbols<cr>",                                                desc = "LSP symbols" },
            { "<leader>ld", "<cmd>FzfLua diagnostics_document<cr>",                                                desc = "LSP Diagnostics" },
            { "gd",         "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto definition" },
            { "gr",         "<cmd>FzfLua lsp_references jump_to_single_result=true ignore_current_line=true<cr>",  desc = "Goto references" },
            { "gt",         "<cmd>FzfLua lsp_typedefs  jump_to_single_result=true ignore_current_line=true<cr>",   desc = "Goto tyepdef" },
        }
    }
}
