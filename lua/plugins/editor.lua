return {
    {
        "echasnovski/mini.ai",
        -- keys = {
        --   { "a", mode = { "x", "o" } },
        --   { "i", mode = { "x", "o" } },
        -- },
        opts = function()
            local ai = require("mini.ai")
            return {
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }, {}),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
                    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
                },
            }
        end,
        config = function(_, opts)
            require("mini.ai").setup(opts)
            -- register all text objects with which-key
            ---@type table<string, string|table>
            local i = {
                [" "] = "Whitespace",
                ['"'] = 'Balanced "',
                ["'"] = "Balanced '",
                ["`"] = "Balanced `",
                ["("] = "Balanced (",
                [")"] = "Balanced ) including white-space",
                [">"] = "Balanced > including white-space",
                ["<lt>"] = "Balanced <",
                ["]"] = "Balanced ] including white-space",
                ["["] = "Balanced [",
                ["}"] = "Balanced } including white-space",
                ["{"] = "Balanced {",
                ["?"] = "User Prompt",
                _ = "Underscore",
                a = "Argument",
                b = "Balanced ), ], }",
                c = "Class",
                f = "Function",
                o = "Block, conditional, loop",
                q = "Quote `, \", '",
                t = "Tag",
            }
            local a = vim.deepcopy(i)
            for k, v in pairs(a) do
                a[k] = v:gsub(" including.*", "")
            end

            local ic = vim.deepcopy(i)
            local ac = vim.deepcopy(a)
            for key, name in pairs({ n = "Next", l = "Last" }) do
                i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
                a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
            end
            require("which-key").register({
                mode = { "o", "x" },
                i = i,
                a = a,
            })
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
    },
    {
        "unblevable/quick-scope",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs                        = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged                 = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signs_staged_enable          = true,
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    follow_files = true
                },
                auto_attach                  = true,
                attach_to_untracked          = false,
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                    virt_text_priority = 100,
                },
                current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil,   -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                on_attach                    = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ ']c', bang = true })
                        else
                            gitsigns.nav_hunk('next')
                        end
                    end)

                    map('n', '[c', function()
                        if vim.wo.diff then
                            vim.cmd.normal({ '[c', bang = true })
                        else
                            gitsigns.nav_hunk('prev')
                        end
                    end)

                    -- Actions
                    map('n', '<leader>hs', gitsigns.stage_hunk)
                    map('n', '<leader>hr', gitsigns.reset_hunk)
                    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
                    map('n', '<leader>hS', gitsigns.stage_buffer)
                    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
                    map('n', '<leader>hR', gitsigns.reset_buffer)
                    map('n', '<leader>hp', gitsigns.preview_hunk)
                    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
                    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
                    map('n', '<leader>hd', gitsigns.diffthis)
                    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
                    map('n', '<leader>td', gitsigns.toggle_deleted)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            }
        end,
    },
    {
        "yuttie/comfortable-motion.vim",
        config = function()
            vim.cmd([[
                let g:comfortable_motion_scroll_down_key = "jzz"
                let g:comfortable_motion_scroll_up_key = "kzz"
                let g:comfortable_motion_friction = 2000.0
            ]])
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'dstein64/nvim-scrollview',
    }
}
