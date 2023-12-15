return {
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
	},
	keys = {
		{
			"<C-n>",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = require("config.util").get_root() })
			end,
			desc = "Explorer NeoTree (root dir)",
		},
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
	},
}
