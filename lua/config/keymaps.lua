-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- vim.keymap.set("i", "hj", "<Esc>", { noremap = true })
-- map("i", "hj", "<ESC>")

-- Unbind / Rebind existing <leader>f
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

map("n", "<leader>rn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>T", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
-- Helix influenced keymaps

map("n", "U", "<C-r>")
-- Helix goto
map("", "gl", "$", { remap = true })
map("", "ge", "G", { remap = true })
map("", "gh", "^", { remap = true })

-- New line insert
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set("n", "<S-CR>", "m`O<Esc>``")

-- Center line
map("n", "<leader><leader>", "z.")

-- Kitty
map("", "<c-h>", ":KittyNavigateLeft<cr>")
map("", "<c-l>", ":KittyNavigateRight<cr>")
map("", "<c-j>", ":KittyNavigateDown<cr>")
map("", "<c-k>", ":KittyNavigateUp<cr>")

-- Text editing
map("n", "<leader>d", '"_d')
map("n", "R", '"_diwP"')
map("n", "x", '"_x')

local function notify(cmd)
  return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd)
end

local function v_notify(cmd)
  return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd)
end
-- VSCode
if vim.g.vscode then
  map("n", "<leader>f", notify("workbench.action.quickOpen"))
  map("n", "<leader>F", notify("workbench.action.findInFiles"))
  map("n", "<leader>e", notify("workbench.view.explorer"))
  map("n", "L", notify("workbench.action.nextEditor"))
  map("n", "H", notify("workbench.action.previousEditor"))
  map("n", "<leader>sd", notify("workbench.actions.view.problems"))
end
