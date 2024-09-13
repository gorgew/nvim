return {
    {
        "bignimbus/pop-punk.vim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            vim.cmd([[colorscheme pop-punk]])
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

        "atelierbram/Base2Tone-nvim",
        lazy = false,
        config = function()
            -- vim.cmd([[colorscheme base2tone_pool_dark]])
        end,
    },
    {

        "atelierbram/Base4Tone-nvim",
        lazy = false,
        config = function()
            --vim.cmd([[colorscheme noctis_viola]])
        end,
    },
    {

        "rose-pine/neovim",
        lazy = false,
        config = function()
            -- vim.cmd([[colorscheme rose-pine-dawn]])
        end,
    },
    --[[
    {
        "rktjmp/shipwright.nvim"
    },
    ]] --
    -- {
    --     "rktjmp/lush.nvim"
    -- },
    -- {
    --     "P-theme",
    --     dir = "~/P-theme",
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         -- load the colorscheme here
    --         vim.cmd([[colorscheme P-theme]])
    --     end,
    -- },
}
