return {
    {
        "MagicDuck/grug-far.nvim",
        config = function()
            require('grug-far').setup({
            });
        end,
        keys = {
            { "<leader>gf", "<cmd>GrugFar<cr>", desc = "Grug Find" },
        }
    }
}
