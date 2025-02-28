vim.g.mapleader = " "

-- Helix influenced keymaps

-- vim.keymap.set("n", "U", "<C-r>")
-- Helix goto
vim.keymap.set("", "gl", "$", { remap = true })
vim.keymap.set("", "ge", "G", { remap = true })
vim.keymap.set("", "gh", "^", { remap = true })

-- New line insert
vim.keymap.set("n", "<CR>", "m`o<Esc>``")
vim.keymap.set("n", "<S-CR>", "m`O<Esc>``")

-- Center line
vim.keymap.set("n", "<leader><leader>", "z.")

-- Kitty
vim.keymap.set("", "<c-h>", ":KittyNavigateLeft<cr>")
vim.keymap.set("", "<c-l>", ":KittyNavigateRight<cr>")
vim.keymap.set("", "<c-j>", ":KittyNavigateDown<cr>")
vim.keymap.set("", "<c-k>", ":KittyNavigateUp<cr>")

-- Void register
-- vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
-- vim.keymap.set({ "n", "v" }, "<leader>c", '"_c')

-- ThePrimagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z") -- appending lines

vim.keymap.set("n", "n", "nzzzv") -- search center line
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

-- Indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>tt", ":terminal<cr>")
