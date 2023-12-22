return {
    {
        "bignimbus/pop-punk.vim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            --vim.cmd([[colorscheme pop-punk]])
        end,
    },

    {

        "talha-akram/noctis.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            --vim.cmd([[colorscheme noctis_viola]])
        end,
    },
    {
        "rktjmp/lush.nvim"
    },
    {
        "P-theme",
        dir = "~/P-theme",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme P-theme]])
        end,
    },
}
