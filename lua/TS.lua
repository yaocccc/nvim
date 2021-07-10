require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
}

local hls = {
    Variable = {fg="NONE"};
    Function = {fg=32};
    Operator = {fg=166};
    KeywordOperator = {fg=166};

    Property = {fg=166};
    Method = {fg=166};
    Field= {fg=150};

    Keyword = {fg=166};
    KeywordFunction = {fg=32};
    Exception = {fg=32};

    Statement = {fg=166};
    Special = {fg=172};
    Comment= {fg=71,sp='italic'};
    Include = {fg=32};
    Type = {fg=172};
    PunctBracket = {fg=151};

    Constructor = {fg=172};
    Namespace = {fg=172};

    String = {fg=37};
    Number = {fg=37};
    Boolean = {fg=37};
}

function highlight(group, color)
    local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
    local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
    local sp = color.sp and ' cterm=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
    vim.api.nvim_command('highlight ' .. 'TS' .. group .. fg .. bg .. sp)
end

for group,colors in pairs(hls) do
    highlight(group, colors)
end
