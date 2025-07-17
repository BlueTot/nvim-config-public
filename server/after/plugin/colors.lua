function ColorMyPencils(color)
    color = color or "kanagawa"
    vim.cmd.colorscheme(color)

    local hl_groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "VertSplit",
        "SignColumn",
        "EndOfBuffer",
        "StatusLine",
        "StatusLineNC",
        "CursorLine",
        "CursorLineNr",
        "LineNr",
        "FoldColumn",
    }

    for _, group in ipairs(hl_groups) do
        vim.api.nvim_set_hl(0, group, { bg = "none" })
    end

    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#e86671" })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "netrw",
        callback = function()
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4b5263" })
        end,
    })

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#ffffff", bg = "none" })

    local colors = {
        Error = "#db4b4b",   -- soft red
        Warn  = "#e0af68",   -- soft yellow
        Info  = "#0db9d7",   -- cyan
        Hint  = "#1abc9c",   -- teal-green
    }

    for type, color in pairs(colors) do
        vim.api.nvim_set_hl(0, "DiagnosticSign" .. type, { fg = color, bg = "none" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. type, { fg = color, bg = "none" })
    end

    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1f2335" })    -- soft dark navy
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#565f89", bg = "#1f2335" })

    vim.api.nvim_set_hl(0, "@markup.strong.markdown", { bold = true, fg="#DCA561" })
    vim.api.nvim_set_hl(0, "@markup.strong.markdown_inline", { bold = true, fg = "#DCA561" })


end

ColorMyPencils()
