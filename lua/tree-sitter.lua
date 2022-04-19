require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "swift" },
    highlight = {
        enable = true
    },
}

require'common'.set_highlights({
    Variable = {fg="NONE"};
    Function = {fg=32};
    Operator = {fg=166};
    KeywordOperator = {fg=166};

    Property = {fg=172};
    Field= {fg=150};
    Method = {fg=166};
    Parameter = {fg=9};

    Keyword = {fg=1};
    KeywordFunction = {fg=32};
    Exception = {fg=32};

    Statement = {fg=166};
    Special = {fg=172};
    Comment= {fg=71,sp='italic'};
    Include = {fg=1};
    Type = {fg=179};
    TypeBuiltin = {fg=150};
    PunctBracket = {fg=151};

    Constructor = {fg=172};
    Namespace = {fg=172};

    String = {fg=37};
    Number = {fg=37};
    Boolean = {fg=37};
})

require'common'.set_maps({ { 'n', 'H', ':TSHighlightCapturesUnderCursor<CR>:lua require"nvim-lines.statusline".refresh_statusline()<cr>', {silent = true, noremap = true}} })
