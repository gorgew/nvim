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

