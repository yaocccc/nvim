if exists('s:loaded') | finish | endif

let s:loaded = 1
hi clear
syntax reset

hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Function Identifier
hi! link Include PreProc
hi! link Keyword Statement
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PreCondit PreProc
hi! link QuickFixLine Search
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Type
hi! link String Constant
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor

hi Normal ctermfg=7 ctermbg=NONE cterm=NONE
hi Cursor ctermfg=fg ctermbg=fg cterm=NONE
hi CursorLineNr ctermfg=80 ctermbg=NONE cterm=bold
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=bold
hi NonText ctermfg=246 ctermbg=NONE cterm=bold
hi SpecialKey ctermfg=246 ctermbg=236 cterm=bold
hi SpellBad ctermfg=61 ctermbg=NONE cterm=underline
hi SpellCap ctermfg=61 ctermbg=NONE cterm=underline
hi SpellLocal ctermfg=136 ctermbg=NONE cterm=underline
hi SpellRare ctermfg=37 ctermbg=NONE cterm=underline
hi Title ctermfg=166 ctermbg=NONE cterm=bold
hi FoldColumn ctermfg=fg ctermbg=NONE cterm=NONE
hi Folded ctermfg=253 ctermbg=NONE cterm=bold
hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
hi Terminal ctermfg=fg ctermbg=NONE cterm=NONE
hi DiffAdd ctermfg=106 ctermbg=236 cterm=NONE
hi DiffChange ctermfg=136 ctermbg=236 cterm=NONE
hi DiffDelete ctermfg=160 ctermbg=236 cterm=bold
hi DiffText ctermfg=32 ctermbg=236 cterm=NONE
hi StatusLine ctermfg=NONE ctermbg=NONE cterm=NONE
hi StatusLineNC ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLine ctermfg=243 ctermbg=NONE cterm=NONE
hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineSel ctermfg=247 ctermbg=NONE cterm=BOLD
hi VertSplit ctermfg=242 ctermbg=NONE cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE
hi Conceal ctermfg=32 ctermbg=NONE cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=240 cterm=NONE
hi Directory ctermfg=32 ctermbg=NONE cterm=NONE
hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
hi ErrorMsg ctermfg=160 ctermbg=230 cterm=reverse
hi Search ctermfg=31 ctermbg=7 cterm=reverse
hi IncSearch ctermfg=5 ctermbg=7 cterm=reverse
hi CurSearch ctermfg=5 ctermbg=7 cterm=reverse
hi MatchParen ctermfg=230 ctermbg=236 cterm=bold
hi ModeMsg ctermfg=32 ctermbg=NONE cterm=NONE
hi MoreMsg ctermfg=32 ctermbg=NONE cterm=NONE
hi Pmenu ctermfg=250 ctermbg=NONE cterm=NONE
hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
hi PmenuSel ctermfg=NONE ctermbg=239 cterm=NONE
hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
hi Question ctermfg=37 ctermbg=NONE cterm=bold
hi SignColumn ctermfg=247 ctermbg=NONE cterm=NONE
hi Visual cterm=reverse
hi VisualNOS ctermfg=NONE ctermbg=236 cterm=reverse
hi WarningMsg ctermfg=166 ctermbg=NONE cterm=bold
hi WildMenu ctermfg=230 ctermbg=236 cterm=reverse
hi Comment ctermfg=71 ctermbg=NONE cterm=italic
hi Constant ctermfg=37 ctermbg=NONE cterm=NONE
hi Error ctermfg=160 ctermbg=230 cterm=bold,reverse
hi Identifier ctermfg=32 ctermbg=NONE cterm=NONE
hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
hi PreProc ctermfg=166 ctermbg=NONE cterm=NONE
hi Special ctermfg=166 ctermbg=NONE cterm=NONE
hi Statement ctermfg=166 ctermbg=NONE cterm=NONE
hi Todo ctermfg=162 ctermbg=NONE cterm=bold
hi Type ctermfg=136 ctermbg=NONE cterm=NONE
hi Underlined ctermfg=61 ctermbg=NONE cterm=NONE
hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
hi ToolbarLine ctermfg=NONE ctermbg=236 cterm=NONE
hi ToolbarButton ctermfg=254 ctermbg=236 cterm=bold
hi NormalMode ctermfg=247 ctermbg=230 cterm=reverse
hi InsertMode ctermfg=37 ctermbg=230 cterm=reverse
hi ReplaceMode ctermfg=166 ctermbg=230 cterm=reverse
hi VisualMode ctermfg=162 ctermbg=230 cterm=reverse
hi CommandMode ctermfg=162 ctermbg=230 cterm=reverse
hi TermCursorNC ctermfg=235 ctermbg=243 cterm=NONE
hi GitGutterAdd    ctermfg=106
hi GitGutterChange ctermfg=136
hi GitGutterDelete ctermfg=160
