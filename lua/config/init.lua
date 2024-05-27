require("config.autocmd")
require("config.keymap")

vim.opt.swapfile = false
vim.opt.tabstop = 4      -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.smartindent = true
vim.opt.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4   -- Number of spaces inserted when indenting
vim.opt.clipboard = "unnamed"
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 100

vim.opt.number = true -- line numbers
vim.opt.relativenumber = true

vim.opt.undofile = true

vim.diagnostic.config({
    virtual_text = true,
})
