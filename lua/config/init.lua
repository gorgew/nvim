require("config.autocmd")
require("config.keymap")

vim.opt.swapfile = false
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.smartindent = true
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.api.nvim_set_option("clipboard", "unnamed") -- yank/paste to clipboard
vim.opt.colorcolumn = "80"
vim.o.wrap = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 100

vim.opt.number = true -- line numbers
vim.opt.relativenumber = true

vim.opt.undofile = true
