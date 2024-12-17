-- Supertab
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()
local cmp_format = require("lsp-zero").cmp_format()

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "neorg" }
    },
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
        ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
    }),
    formatting = cmp_format,
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
})

--Mason-null-ls

local lsp = require("lsp-zero").preset({
    name = "minimal",
    --set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})

lsp.setup()

local null_ls = require("null-ls")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
        ---
        -- you can add other stuff here....
        ---
    end,
    sources = {
        -- Replace these with the tools you want to install
        null_ls.builtins.formatting.prettier.with({
            disabled_filetypes = { "graphql" }
        }),
        -- null_ls.builtins.formatting.black,
        --         null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.formatting.google_java_format,
    },
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require("mason-null-ls").setup({
    ensure_installed = {
        "google_java_format"
    },
    automatic_installation = true,
    automatic_setup = false,
})
-- Autoformat
local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
    --lsp_zero.default_keymaps({ buffer = bufnr })
    if client.server_capabilities.documentSymbolProvider then
        require('nvim-navic').attach(client, bufnr)
    end
    -- if client.supports_method("textDocument/formatting") then
    --     if client.name ~= "clangd" or client.name ~= "json" then
    --         require("lsp-format").on_attach(client)
    --     end
    -- end
    if client.name == "clangd" then
        vim.keymap.set("n", "<leader>lh", "<cmd>ClangdSwitchSourceHeader<cr>", { buffer = true })
    end
end)


vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
