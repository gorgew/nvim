require("config.autocmd")
require("config.keymap")

vim.opt.swapfile = false
vim.opt.tabstop = 4      -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.smartindent = true
vim.opt.softtabstop = 4  -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4   -- Number of spaces inserted when indenting
vim.opt.clipboard = "unnamedplus"
-- vim.opt.colorcolumn = "80"
vim.opt.signcolumn= "auto:1"

-- vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.breakindentopt = "shift:2,min:40"
vim.opt.linebreak = true
vim.opt.showbreak = "󱞵 "
vim.opt.breakat = " ^!@;,?"

vim.opt.scrolloff = 8

vim.opt.updatetime = 100

-- vim.opt.number = true -- line numbers
-- vim.opt.relativenumber = true

vim.opt.undofile = true

vim.diagnostic.config({
    virtual_text = true,
})

vim.opt.termguicolors = true

vim.g.maplocalleader = ','

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.shortmess =  "ltToOCFI"

-- vim.opt.guicursor =
-- "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

--space:·

vim.opt.list = true
-- vim.opt.listchars="eol:↵,trail:~,tab:󰌒,nbsp:␣,multispace:·       "
vim.opt.listchars="eol:↵,trail:~,tab:󰌒,nbsp:␣"

vim.cmd([[
" set list
" set listchars=eol:↵,trail:~,tab:󰌒,nbsp:␣,multispace:·   
]])
