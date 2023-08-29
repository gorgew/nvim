local Util = require("lazyvim.util")
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>fe", vim.NIL },
      { "<leader>fE", vim.NIL },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>fb", vim.NIL },
      { "<leader>ff", vim.NIL },
      { "<leader>fF", vim.NIL },
      { "<leader>fr", vim.NIL },
      { "<leader>fR", vim.NIL },
      { "<leader><space>", vim.NIL },
      { "<leader>/", vim.NIL },
      { "<leader><C-f>", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
      { "<leader>f", Util.telescope("files"), desc = "Find Files (root dir)" },
      { "<leader>F", Util.telescope("live_grep"), desc = "Grep (root dir)" },
      { "<leader>rf", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    },
  },
}
