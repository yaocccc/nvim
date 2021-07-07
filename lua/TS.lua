require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
}

local hls = {
    TSVariable = {fg=152};
    TSFunction = {fg=32};

    TSProperty = {fg=166};
    TSMethod = {fg=148};
    TSField= {fg=150};

    TSKeywordFunction = {fg=32};
    TSOperator = {fg=166};
    TSKeywordOperator = {fg=166};

    TSException = {fg=118};
    TSKeyword = {fg=118};

    TSPunctBracket = {fg=151};

    TSInclude = {fg=32};
    TSComment= {fg=71,sp='italic'};
    TSType = {fg=172};

    TSConstructor = {fg=172};
    TSNamespace = {fg=172};

    TSString = {fg=37};
    TSNumber = {fg=37}
}

function highlight(group, color)
    local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
    local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
    local sp = color.sp and ' cterm=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
end

for group,colors in pairs(hls) do
    highlight(group, colors)
end
