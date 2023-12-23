--[[
vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
    desc = "Open Neotree automatically",
    group = "neotree",
    callback = function()
        if vim.fn.argc() == 0 then
            vim.cmd("Neotree toggle")
        end
    end,
})
]]
   --

vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])

--https://old.reddit.com/r/neovim/comments/wcmqi7/a_simple_utility_function_to_override_and_update/
local function mod_hl(hl_name, opts)
    local is_ok, hl_def = pcall(vim.api.nvim_get_hl_by_name, hl_name, true)
    if is_ok then
        for k, v in pairs(opts) do hl_def[k] = v end
        vim.api.nvim_set_hl(0, hl_name, hl_def)
    end
end

vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
    group = vim.api.nvim_create_augroup('Color', {}),
    pattern = "*",
    callback = function()
        --[[
        mod_hl("TSInclude", { bold = true, italic = true })
        mod_hl("TSKeywordReturn", { bold = true, italic = true })
        mod_hl("TSConstBuiltin", { bold = true, italic = true })
        ]]
        --

        -- mod_hl("DiagnosticError", { bg = "Red" })
        -- mod_hl("DiagnosticUnderlineError", { bg = "Red" })
        --
        -- mod_hl("DiagnosticHint", { bg = "DarkCyan", fg = "White" })
        -- mod_hl("DiagnosticUnderlineHint", { bg = "DarkCyan", fg = "White" })
        --
        -- mod_hl("DiagnosticWarn", { bg = "Orange", fg = "White" })
        -- mod_hl("DiagnosticUnderlineWarn", { bg = "Orange", fg = "White" })
        --
        -- mod_hl("DiagnosticUnnecessary", { bg = "Orange", fg = "White" })
    end
})

-- Cursor color
vim.cmd([[
set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50
]])
