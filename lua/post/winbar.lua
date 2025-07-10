function WinbarFile()
    if vim.bo.modified then
        return "%#WinbarBold#%f*"
    else
        return "%f"
    end
end

function Winbar()
    return "%{%v:lua.WinbarFile()%}> %{%v:lua.require'nvim-navic'.get_location()%}"
end

vim.api.nvim_set_hl(0, 'WinbarBold', { bold = true, fg='#ffffff' })

vim.o.winbar = "%{%v:lua.Winbar()%}"
