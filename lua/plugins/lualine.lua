return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            {

                'f-person/git-blame.nvim',
                opts = {
                    message_template = "@<author>#<summary>|<sha>"
                }
            }
        },
        config = function()
            -- Lua
            vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
            vim.g.gitblame_delay = 0

            local git_blame = require('gitblame')

            local function parsed_blame_text()
                local blame_text_raw = git_blame.get_current_blame_text()

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
                    if (string.len(summary) > 30) then
                        summary = string.sub(summary, 1, 27) .. "..."
                    end

                    i, j = string.find(blame_text_raw, "|")

                    local sha = string.sub(blame_text_raw, i + 1, string.len(blame_text_raw))

                    return author .. " | " .. summary .. " | " .. sha
                end
                return blame_text_raw
            end

            require('lualine').setup({
                sections = {
                    lualine_x = {
                        { parsed_blame_text, cond = git_blame.is_blame_text_available }
                    }
                }
            })
        end
    }
}
