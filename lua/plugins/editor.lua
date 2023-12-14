vim.cmd("let g:comfortable_motion_friction = 2000.0")
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      mappings = {
        ["<cr>"] = "open_vsplit",
      },
    },
  },
  {
    "yuttie/comfortable-motion.vim",
    vscode = true,
  },
  {
    "mortepau/codicons.nvim",
  },
  {
    "unblevable/quick-scope",
  },
  {
    "rhysd/vim-llvm",
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/notes",
              },
            },
          },
        },
      })
    end,
  },
}
