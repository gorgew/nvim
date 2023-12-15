return {
	"aspeddro/gitui.nvim",
	config = function()
		require("gitui").setup()
	end,
	keys = {
		{ "<leader>g", "<cmd>Gitui<cr>", desc = "Gitui" },
	},
}
