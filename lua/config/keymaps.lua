-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
map("i", "hj", "<ESC>")

-- Unbind / Rebind existing <leader>f
vim.keymap.del("n", "<leader>fn")
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

map("n", "<leader>rn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fT", function()
  Util.float_term()
end, { desc = "Terminal (cwd)" })
-- Helix influenced keymaps

map("n", "U", "<C-r>")
-- Helix goto
map("", "gl", "$", { remap = true })
map("", "ge", "G", { remap = true })

-- New line insert
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set("n", "<S-CR>", "m`O<Esc>``")
