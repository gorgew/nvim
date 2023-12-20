return {
    --{ import = "plugins.lang" },
    "folke/neodev.nvim",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    { "folke/neoconf.nvim", cmd = "Neoconf" },
}
