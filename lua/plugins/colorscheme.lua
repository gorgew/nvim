-- https://rrethy.github.io/book/colorscheme.html
-- this is our single source of truth created above
local base16_theme_fname = vim.fn.expand(vim.env.HOME .. "/.config/kitty/.base16_theme")
-- this function is the only way we should be setting our colorscheme
local function set_colorscheme(name)
  -- write our colorscheme back to our single source of truth
  vim.fn.writefile({ name }, base16_theme_fname)
  -- set Neovim's colorscheme
  vim.cmd("colorscheme " .. name)
  -- execute `kitty @ set-colors -c <color>` to change terminal window's
  -- colors and newly created terminal windows colors
  vim.loop.spawn("kitty", {
    args = {
      "@",
      "set-colors",
      "-c",
      string.format(vim.env.HOME .. "/.config/kitty/base16-kitty/colors/%s.conf", name),
    },
  }, nil)
end

return {
  {
    "rrethy/nvim-base16",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = vim.fn.readfile(base16_theme_fname)[1],
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>uC",
        function()
          -- get our base16 colorschemes
          local colors = vim.fn.getcompletion("base16", "color")
          -- we're trying to mimic VSCode so we'll use dropdown theme
          local theme = require("telescope.themes").get_dropdown()
          local telescope_actions = require("telescope.actions")
          local telescope_action_set = require("telescope.actions.set")
          local action_state = require("telescope.actions.state")
          -- create our picker
          require("telescope.pickers")
            .new(theme, {
              prompt = "Change Base16 Colorscheme",
              finder = require("telescope.finders").new_table({
                results = colors,
              }),
              sorter = require("telescope.config").values.generic_sorter(theme),
              attach_mappings = function(bufnr)
                -- change the colors upon selection
                telescope_actions.select_default:replace(function()
                  set_colorscheme(action_state.get_selected_entry().value)
                  telescope_actions.close(bufnr)
                end)
                telescope_action_set.shift_selection:enhance({
                  -- change the colors upon scrolling
                  post = function()
                    set_colorscheme(action_state.get_selected_entry().value)
                  end,
                })
                return true
              end,
            })
            :find()
        end,
      },
    },
  },
  --[[
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "dracula-nvim",
    },
  },
  --]]
}
