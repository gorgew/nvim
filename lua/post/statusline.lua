function GitBlameFormatted()
    local git_blame = require('gitblame')

    local blame_text_raw = git_blame.get_current_blame_text()

    if blame_text_raw == nil or blame_text_raw == '' then
        return ''
    end

    if string.sub(blame_text_raw, 1, 1) == '@' then
        local i, j = string.find(blame_text_raw, "@.*#")
        local author = string.sub(blame_text_raw, i + 1, j - 1)


        i, j = string.find(blame_text_raw, "#.*|")
        local summary = string.sub(blame_text_raw, i + 1, j - 1)


        if string.sub(summary, 1, 1) == '[' then -- commit type [...]
            i, j = string.find(summary, "%[.*%]")
            summary = string.sub(summary, j + 1, string.len(summary))
        end

        -- shorten summary to 25 characters
        if (string.len(summary) > 25) then
            summary = string.sub(summary, 1, 23) .. "..."
        end

        i, j = string.find(blame_text_raw, "|.*%$")
        local sha = string.sub(blame_text_raw, i + 1, j - 1)

        i, j = string.find(blame_text_raw, "%$")

        local date = string.sub(blame_text_raw, i + 1, string.len(blame_text_raw))

        return author .. ": " .. summary .. " " .. date .. " <" .. sha .. ">"
    end
    return blame_text_raw
end

function Statusline()
    -- return "%{%v:lua.GitBlameFormatted()%}"
    return "%-f"
end

-- vim.o.statusline = "%{%v:lua.Statusline()%}"
vim.o.statusline =  "%{%v:lua.GitBlameFormatted()%} %=%-14.(%l,%c%V%) %P"
