return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require("telescope.actions")
      opts.defaults.mappings.i = vim.tbl_extend("force", opts.defaults.mappings.i, {
        ["<esc>"] = actions.close,
      })
    end,
  },
}