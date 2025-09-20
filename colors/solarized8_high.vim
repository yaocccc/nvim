if exists('s:loaded') | finish | endif

let s:loaded = 1
hi clear
syntax reset

" 语法高亮链接
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

" 高亮定义，同时支持 GUI 和 256 色
hi Normal guifg=#c0c0c0 guibg=NONE ctermfg=7 ctermbg=NONE cterm=NONE gui=NONE
hi NormalFloat guibg=NONE
hi Cursor guifg=fg guibg=fg ctermfg=fg ctermbg=fg cterm=NONE gui=NONE
hi CursorLineNr guifg=#5fd7ff guibg=NONE ctermfg=80 ctermbg=NONE cterm=bold gui=bold
hi CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=bold gui=bold
hi NonText guifg=#949494 guibg=NONE ctermfg=246 ctermbg=NONE cterm=bold gui=bold
hi SpecialKey guifg=#949494 guibg=#303030 ctermfg=246 ctermbg=236 cterm=bold gui=bold
hi SpellBad guifg=#5f5faf guibg=NONE ctermfg=61 ctermbg=NONE cterm=underline gui=underline
hi SpellCap guifg=#5f5faf guibg=NONE ctermfg=61 ctermbg=NONE cterm=underline gui=underline
hi SpellLocal guifg=#af8700 guibg=NONE ctermfg=136 ctermbg=NONE cterm=underline gui=underline
hi SpellRare guifg=#00afaf guibg=NONE ctermfg=37 ctermbg=NONE cterm=underline gui=underline
hi Title guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE cterm=bold gui=bold
hi FoldColumn guifg=#87afff guibg=NONE ctermfg=111 ctermbg=NONE cterm=NONE gui=NONE
hi Folded guifg=#a8a8a8 guibg=NONE ctermfg=248 ctermbg=NONE cterm=bold gui=bold
hi LineNr guifg=#767676 guibg=NONE ctermfg=243 ctermbg=NONE cterm=NONE gui=NONE
hi Terminal guifg=fg guibg=NONE ctermfg=fg ctermbg=NONE cterm=NONE gui=NONE
hi DiffAdd guifg=#87af00 guibg=#303030 ctermfg=106 ctermbg=236 cterm=NONE gui=NONE
hi DiffChange guifg=#af8700 guibg=#303030 ctermfg=136 ctermbg=236 cterm=NONE gui=NONE
hi DiffDelete guifg=#d70000 guibg=#303030 ctermfg=160 ctermbg=236 cterm=bold gui=bold
hi DiffText guifg=#0087ff guibg=#303030 ctermfg=32 ctermbg=236 cterm=NONE gui=NONE
hi StatusLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi StatusLineNC guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi TabLine guifg=#767676 guibg=NONE ctermfg=243 ctermbg=NONE cterm=NONE gui=NONE
hi TabLineFill guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi TabLineSel guifg=#9e9e9e guibg=NONE ctermfg=247 ctermbg=NONE cterm=bold gui=bold
hi VertSplit guifg=#4e4e4e guibg=NONE ctermfg=242 ctermbg=NONE cterm=NONE gui=NONE
hi ColorColumn guifg=NONE guibg=#303030 ctermfg=NONE ctermbg=236 cterm=NONE gui=NONE
hi Conceal guifg=#0087ff guibg=NONE ctermfg=32 ctermbg=NONE cterm=NONE gui=NONE
hi CursorColumn guifg=NONE guibg=#585858 ctermfg=NONE ctermbg=240 cterm=NONE gui=NONE
hi Directory guifg=#0087ff guibg=NONE ctermfg=32 ctermbg=NONE cterm=NONE gui=NONE
hi EndOfBuffer guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi ErrorMsg guifg=#d70000 guibg=#ffffd7 ctermfg=160 ctermbg=230
hi Search guifg=#00af87 guibg=#c0c0c0 ctermfg=31 ctermbg=7 cterm=reverse gui=reverse
hi IncSearch guifg=#ff00ff guibg=#c0c0c0 ctermfg=5 ctermbg=7 cterm=reverse gui=reverse
hi CurSearch guifg=#ff00ff guibg=#c0c0c0 ctermfg=5 ctermbg=7 cterm=reverse gui=reverse
hi MatchParen guifg=#ffffd7 guibg=#303030 ctermfg=230 ctermbg=236 cterm=bold gui=bold
hi ModeMsg guifg=#0087ff guibg=NONE ctermfg=32 ctermbg=NONE cterm=NONE gui=NONE
hi MoreMsg guifg=#0087ff guibg=NONE ctermfg=32 ctermbg=NONE cterm=NONE gui=NONE
hi Pmenu guifg=#bcbcbc guibg=NONE ctermfg=250 ctermbg=NONE cterm=NONE gui=NONE
hi PmenuSbar guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#4e4e4e ctermfg=NONE ctermbg=239 cterm=NONE gui=NONE
hi PmenuThumb guifg=NONE guibg=#767676 ctermfg=NONE ctermbg=243 cterm=NONE gui=NONE
hi Question guifg=#00afaf guibg=NONE ctermfg=37 ctermbg=NONE cterm=bold gui=bold
hi SignColumn guifg=#9e9e9e guibg=NONE ctermfg=247 ctermbg=NONE cterm=NONE gui=NONE
hi Visual guifg=NONE guibg=NONE ctermfg=NONE cterm=reverse gui=reverse
hi VisualNOS guifg=NONE guibg=#303030 ctermfg=NONE ctermbg=236 cterm=reverse gui=reverse
hi WarningMsg guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE cterm=bold gui=bold
hi WildMenu guifg=#ffffd7 guibg=#303030 ctermfg=230 ctermbg=236 cterm=reverse gui=reverse
hi Comment guifg=#5faf5f guibg=NONE ctermfg=71 ctermbg=NONE cterm=italic gui=italic
hi Constant guifg=#00afaf guibg=NONE ctermfg=37 ctermbg=NONE cterm=NONE gui=NONE
hi Error guifg=#d70000 guibg=#ffffd7 ctermfg=160 ctermbg=230 cterm=bold gui=bold
hi Identifier guifg=#0087ff guibg=NONE ctermfg=32 ctermbg=NONE cterm=NONE gui=NONE
hi Ignore guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE cterm=NONE gui=NONE
hi PreProc guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE cterm=NONE gui=NONE
hi Special guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE cterm=NONE gui=NONE
hi Statement guifg=#d75f00 guibg=NONE ctermfg=166 ctermbg=NONE cterm=NONE gui=NONE
hi Type guifg=#af8700 guibg=NONE ctermfg=136 ctermbg=NONE cterm=NONE gui=NONE
hi Underlined guifg=#5f5faf guibg=NONE ctermfg=61 ctermbg=NONE cterm=NONE gui=NONE
hi CursorIM guifg=NONE guibg=fg ctermfg=NONE ctermbg=fg cterm=NONE gui=NONE
hi ToolbarLine guifg=NONE guibg=#303030 ctermfg=NONE ctermbg=236 cterm=NONE gui=NONE
hi ToolbarButton guifg=#e4e4e4 guibg=#303030 ctermfg=254 ctermbg=236 cterm=bold gui=bold
hi NormalMode guifg=#9e9e9e guibg=#ffffd7 ctermfg=247 ctermbg=230 cterm=reverse gui=reverse
hi InsertMode guifg=#00afaf guibg=#ffffd7 ctermfg=37 ctermbg=230 cterm=reverse gui=reverse
hi ReplaceMode guifg=#d75f00 guibg=#ffffd7 ctermfg=166 ctermbg=230 cterm=reverse gui=reverse
hi VisualMode guifg=#d70087 guibg=#ffffd7 ctermfg=162 ctermbg=230 cterm=reverse gui=reverse
hi CommandMode guifg=#d70087 guibg=#ffffd7 ctermfg=162 ctermbg=230 cterm=reverse gui=reverse
hi TermCursorNC guifg=#262626 guibg=#767676 ctermfg=235 ctermbg=243 cterm=NONE gui=NONE
hi GitGutterAdd guifg=#87af00 ctermfg=106
hi GitGutterChange guifg=#af8700 ctermfg=136
hi GitGutterDelete guifg=#d70000 ctermfg=160
