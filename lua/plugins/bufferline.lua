return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        init = function()
            require("bufferline").setup {}
        end

        ,
        keys = {
            { "L", ":bnext<cr>", desc = "Go to next harpoon mark" },
            { "H", ":bprev<cr>", desc = "Go to previous harpoon mark" },
        }
    }
}
