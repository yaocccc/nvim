if exists('s:loaded')
    finish
endif
let s:loaded = 1

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'solarized8_high'
let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (((&t_ZH != '' && &t_ZH != '[7m')) && !has('iOS')) || has('nvim')
let s:t_Co = get(g:, 'solarized_use16', 0) ? 16 : s:t_Co
let s:italics = s:italics && get(g:, 'solarized_italics', 1)
let s:termtrans = get(g:, 'solarized_termtrans', 0)

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

hi Cursor ctermfg=230 ctermbg=32 cterm=NONE
hi CursorLineNr ctermfg=247 cterm=bold
hi NonText ctermfg=246 ctermbg=NONE cterm=bold
hi SpecialKey ctermfg=246 ctermbg=236 cterm=bold
hi SpellBad ctermfg=61 ctermbg=NONE cterm=underline
hi SpellCap ctermfg=61 ctermbg=NONE cterm=underline
hi SpellLocal ctermfg=136 ctermbg=NONE cterm=underline
hi SpellRare ctermfg=37 ctermbg=NONE cterm=underline
hi Title ctermfg=166 ctermbg=NONE cterm=bold
hi Normal ctermfg=7 ctermbg=NONE cterm=NONE
hi FoldColumn ctermfg=fg ctermbg=NONE cterm=NONE
hi Folded ctermfg=fg ctermbg=NONE cterm=bold
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
hi VertSplit ctermfg=240 ctermbg=NONE cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE
hi Conceal ctermfg=32 ctermbg=NONE cterm=NONE
hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE
hi CursorLine cterm=bold ctermfg=NONE ctermbg=NONE
hi Directory ctermfg=32 ctermbg=NONE cterm=NONE
hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
hi ErrorMsg ctermfg=160 ctermbg=230 cterm=reverse
hi IncSearch ctermfg=5 ctermbg=7 cterm=reverse
hi MatchParen ctermfg=230 ctermbg=236 cterm=bold
hi ModeMsg ctermfg=32 ctermbg=NONE cterm=NONE
hi MoreMsg ctermfg=32 ctermbg=NONE cterm=NONE
hi Pmenu ctermfg=250 ctermbg=238 cterm=NONE
hi PmenuSbar ctermfg=NONE ctermbg=247 cterm=NONE
hi PmenuSel ctermfg=230 ctermbg=243 cterm=NONE
hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
hi Question ctermfg=37 ctermbg=NONE cterm=bold
hi Search ctermfg=31 ctermbg=7 cterm=reverse
hi SignColumn ctermfg=247 ctermbg=NONE cterm=NONE
hi Visual ctermfg=7 ctermbg=31 cterm=NONE
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
hi Statement ctermfg=106 ctermbg=NONE cterm=NONE
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
hi GitGutterAdd    ctermfg=106
hi GitGutterChange ctermfg=136
hi GitGutterDelete ctermfg=160
if !s:italics
  hi Comment cterm=NONE
endif
if has('nvim')
  hi! link TermCursor Cursor
  hi TermCursorNC ctermfg=235 ctermbg=243 cterm=NONE
endif
if !get(g:, 'solarized_extra_hi_groups', 0)
  unlet s:t_Co s:italics s:termtrans
  finish
endif
hi! link vimVar Identifier
hi! link vimFunc Function
hi! link vimUserFunc Function
hi! link helpSpecial Special
hi! link vimSet Normal
hi! link vimSetEqual Normal
hi vimCommentString ctermfg=61 ctermbg=NONE cterm=NONE
hi vimCommand ctermfg=136 ctermbg=NONE cterm=NONE
hi vimCmdSep ctermfg=32 ctermbg=NONE cterm=bold
hi helpExample ctermfg=254 ctermbg=NONE cterm=NONE
hi helpOption ctermfg=37 ctermbg=NONE cterm=NONE
hi helpNote ctermfg=162 ctermbg=NONE cterm=NONE
hi helpVim ctermfg=162 ctermbg=NONE cterm=NONE
hi helpHyperTextJump ctermfg=32 ctermbg=NONE cterm=NONE
hi helpHyperTextEntry ctermfg=106 ctermbg=NONE cterm=NONE
hi vimIsCommand ctermfg=246 ctermbg=NONE cterm=NONE
hi vimSynMtchOpt ctermfg=136 ctermbg=NONE cterm=NONE
hi vimSynType ctermfg=37 ctermbg=NONE cterm=NONE
hi vimHiLink ctermfg=32 ctermbg=NONE cterm=NONE
hi vimHiGroup ctermfg=32 ctermbg=NONE cterm=NONE
hi vimGroup ctermfg=32 ctermbg=NONE cterm=bold
hi! link diffAdded Statement
hi! link diffLine Identifier
hi gitcommitComment ctermfg=243 ctermbg=NONE cterm=italic
hi! link gitcommitUntracked gitcommitComment
hi! link gitcommitDiscarded gitcommitComment
hi! link gitcommitSelected gitcommitComment
hi gitcommitUnmerged ctermfg=106 ctermbg=NONE cterm=bold
hi gitcommitOnBranch ctermfg=243 ctermbg=NONE cterm=bold
hi gitcommitBranch ctermfg=162 ctermbg=NONE cterm=bold
hi! link gitcommitNoBranch gitcommitBranch
hi gitcommitdiscardedtype ctermfg=160 ctermbg=NONE cterm=NONE
hi gitcommitselectedtype ctermfg=106 ctermbg=NONE cterm=NONE
hi gitcommitHeader ctermfg=243 ctermbg=NONE cterm=NONE
hi gitcommitUntrackedFile ctermfg=37 ctermbg=NONE cterm=bold
hi gitcommitDiscardedFile ctermfg=160 ctermbg=NONE cterm=bold
hi gitcommitSelectedFile ctermfg=106 ctermbg=NONE cterm=bold
hi gitcommitUnmergedFile ctermfg=136 ctermbg=NONE cterm=bold
hi gitcommitFile ctermfg=247 ctermbg=NONE cterm=bold
hi! link gitcommitDiscardedArrow gitcommitDiscardedFile
hi! link gitcommitSelectedArrow gitcommitSelectedFile
hi! link gitcommitUnmergedArrow gitcommitUnmergedFile
hi htmlTag ctermfg=243 ctermbg=NONE cterm=NONE
hi htmlEndTag ctermfg=243 ctermbg=NONE cterm=NONE
hi htmlTagN ctermfg=254 ctermbg=NONE cterm=bold
hi htmlTagName ctermfg=32 ctermbg=NONE cterm=bold
hi htmlSpecialTagName ctermfg=32 ctermbg=NONE cterm=italic
hi htmlArg ctermfg=246 ctermbg=NONE cterm=NONE
hi javaScript ctermfg=136 ctermbg=NONE cterm=NONE
hi! link jsFuncCall Function
hi perlHereDoc ctermfg=254 ctermbg=235 cterm=NONE
hi perlVarPlain ctermfg=136 ctermbg=235 cterm=NONE
hi perlStatementFileDesc ctermfg=37 ctermbg=235 cterm=NONE
hi texstatement ctermfg=37 ctermbg=235 cterm=NONE
hi texmathzonex ctermfg=136 ctermbg=235 cterm=NONE
hi texmathmatcher ctermfg=136 ctermbg=235 cterm=NONE
hi texreflabel ctermfg=136 ctermbg=235 cterm=NONE
hi rubyDefine ctermfg=254 ctermbg=235 cterm=bold
hi! link rubySymbol Type
hi rubyBoolean ctermfg=162 ctermbg=235 cterm=NONE
hi cPreCondit ctermfg=166 ctermbg=NONE cterm=NONE
hi VarId ctermfg=32 ctermbg=NONE cterm=NONE
hi ConId ctermfg=136 ctermbg=NONE cterm=NONE
hi hsImport ctermfg=162 ctermbg=NONE cterm=NONE
hi hsString ctermfg=246 ctermbg=NONE cterm=NONE
hi hsStructure ctermfg=37 ctermbg=NONE cterm=NONE
hi hs_hlFunctionName ctermfg=32 ctermbg=NONE cterm=NONE
hi hsStatement ctermfg=37 ctermbg=NONE cterm=NONE
hi hsImportLabel ctermfg=37 ctermbg=NONE cterm=NONE
hi hs_OpFunctionName ctermfg=136 ctermbg=NONE cterm=NONE
hi hs_DeclareFunction ctermfg=166 ctermbg=NONE cterm=NONE
hi hsVarSym ctermfg=37 ctermbg=NONE cterm=NONE
hi hsType ctermfg=136 ctermbg=NONE cterm=NONE
hi hsTypedef ctermfg=37 ctermbg=NONE cterm=NONE
hi hsModuleName ctermfg=106 ctermbg=NONE cterm=NONE
hi! link hsImportParams Delimiter
hi! link hsDelimTypeExport Delimiter
hi! link hsModuleStartLabel hsStructure
hi! link hsModuleWhereLabel hsModuleStartLabel
hi hsNiceOperator ctermfg=37 ctermbg=NONE cterm=NONE
hi hsniceoperator ctermfg=37 ctermbg=NONE cterm=NONE
if !s:italics
  hi gitcommitComment cterm=NONE
  hi htmlSpecialTagName cterm=NONE
endif
unlet s:termtrans
unlet s:t_Co s:italics
finish
