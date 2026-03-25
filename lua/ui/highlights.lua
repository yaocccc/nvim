local hl = function(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

local links = {
    Boolean          = 'Constant',
    Character        = 'Constant',
    Conditional      = 'Statement',
    Debug            = 'Special',
    Define           = 'PreProc',
    Delimiter        = 'Special',
    Exception        = 'Statement',
    Float            = 'Constant',
    Function         = 'Identifier',
    Include          = 'PreProc',
    Keyword          = 'Statement',
    Label            = 'Statement',
    Macro            = 'PreProc',
    Number           = 'Constant',
    Operator         = 'Statement',
    PreCondit        = 'PreProc',
    QuickFixLine     = 'Search',
    Repeat           = 'Statement',
    SpecialChar      = 'Special',
    SpecialComment   = 'Special',
    StatusLineTerm   = 'StatusLine',
    StatusLineTermNC = 'StatusLineNC',
    StorageClass     = 'Type',
    String           = 'Constant',
    Structure        = 'Type',
    Tag              = 'Special',
    Typedef          = 'Type',
    lCursor          = 'Cursor',
    WinBar           = 'StatusLine',
}

for from, to in pairs(links) do
    hl(from, { link = to })
end

hl('Normal', { fg = '#c0c0c0', ctermfg = 7 })
hl('NormalFloat', {})
hl('Cursor', { fg = 'fg', bg = 'fg' })
hl('CursorLineNr', { fg = '#5fd7ff', bold = true })
hl('CursorLine', { bold = true })
hl('NonText', { fg = '#949494', bold = true })
hl('SpecialKey', { fg = '#949494', bg = '#303030', bold = true })
hl('SpellBad', { fg = '#5f5faf', underline = true })
hl('SpellCap', { fg = '#5f5faf', underline = true })
hl('SpellLocal', { fg = '#af8700', underline = true })
hl('SpellRare', { fg = '#00afaf', underline = true })
hl('Title', { fg = '#d75f00', bold = true })
hl('FoldColumn', { fg = '#87afff' })
hl('Folded', { fg = '#a8a8a8', bold = true })
hl('LineNr', { fg = '#767676' })
hl('Terminal', { fg = 'fg' })
hl('DiffAdd', { fg = '#87af00', bg = '#303030' })
hl('DiffChange', { fg = '#af8700', bg = '#303030' })
hl('DiffDelete', { fg = '#d70000', bg = '#303030', bold = true })
hl('DiffText', { fg = '#0087ff', bg = '#303030' })
hl('StatusLine', {})
hl('StatusLineNC', {})
hl('TabLine', { fg = '#767676' })
hl('TabLineFill', {})
hl('TabLineSel', { fg = '#9e9e9e', bold = true })
hl('VertSplit', { fg = '#4e4e4e' })
hl('ColorColumn', { bg = '#303030' })
hl('Conceal', { fg = '#0087ff' })
hl('CursorColumn', { bg = '#585858' })
hl('Directory', { fg = '#0087ff' })
hl('EndOfBuffer', {})
hl('ErrorMsg', { fg = '#d70000', bg = '#ffffd7' })
hl('Search', { fg = '#00af87', bg = '#c0c0c0', reverse = true })
hl('IncSearch', { fg = '#ff00ff', bg = '#c0c0c0', reverse = true })
hl('CurSearch', { fg = '#ff00ff', bg = '#c0c0c0', reverse = true })
hl('MatchParen', { fg = '#ffffd7', bg = '#303030', bold = true })
hl('ModeMsg', { fg = '#0087ff' })
hl('MoreMsg', { fg = '#0087ff' })
hl('Pmenu', { fg = '#bcbcbc' })
hl('PmenuSbar', {})
hl('PmenuSel', { bg = '#4e4e4e' })
hl('PmenuThumb', { bg = '#767676' })
hl('Question', { fg = '#00afaf', bold = true })
hl('SignColumn', { fg = '#9e9e9e' })
hl('Visual', { reverse = true })
hl('VisualNOS', { bg = '#303030', reverse = true })
hl('WarningMsg', { fg = '#d75f00', bold = true })
hl('WildMenu', { fg = '#ffffd7', bg = '#303030', reverse = true })
hl('Comment', { fg = '#5faf5f', italic = true })
hl('Constant', { fg = '#00afaf' })
hl('Error', { fg = '#d70000', bg = '#ffffd7', bold = true })
hl('Identifier', { fg = '#0087ff' })
hl('Ignore', {})
hl('PreProc', { fg = '#d75f00' })
hl('Special', { fg = '#d75f00' })
hl('Statement', { fg = '#d75f00' })
hl('Type', { fg = '#af8700' })
hl('Underlined', { fg = '#5f5faf' })
hl('CursorIM', { bg = 'fg' })
hl('ToolbarLine', { bg = '#303030' })
hl('ToolbarButton', { fg = '#e4e4e4', bg = '#303030', bold = true })
hl('NormalMode', { fg = '#9e9e9e', bg = '#ffffd7', reverse = true })
hl('InsertMode', { fg = '#00afaf', bg = '#ffffd7', reverse = true })
hl('ReplaceMode', { fg = '#d75f00', bg = '#ffffd7', reverse = true })
hl('VisualMode', { fg = '#d70087', bg = '#ffffd7', reverse = true })
hl('CommandMode', { fg = '#d70087', bg = '#ffffd7', reverse = true })
hl('TermCursorNC', { fg = '#262626', bg = '#767676' })
hl('GitGutterAdd', { fg = '#40e08f' })
hl('GitGutterChange', { fg = '#e7df2f' })
hl('GitGutterDelete', { fg = '#ff3686' })
hl('DiagnosticSignError', { fg = '#ff7686' })
hl('DiagnosticSignWarn', { fg = '#e7df2f' })
hl('DiagnosticSignInfo', { fg = '#30f08f' })
