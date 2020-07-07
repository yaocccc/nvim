augroup lines
    au!
    au VimEnter * call SetStatusline()
    au BufEnter,BufWritePost,TextChanged,TextChangedI * call SetTabline()
augroup END

let g:currentmode={ "n": "NORMAL", "v": "VISUAL", "V": "V-LINE", "\<c-v>": "V-CODE", "i": "INSERT", "R": "R", "r": "R", "Rv": "V-REPLACE", "c": "CMD-IN", "s": "SELECT", "S": "SELECT", "\<c-s>": "SELECT", "t": "TERMINAL"}
hi User1 ctermbg=24
hi User2 ctermbg=238
hi User3 ctermbg=25

func! SetStatusline()
    let &statusline = '%1* %{g:currentmode[mode()]} %* %2* %{Err_num()} %* %2*%{GitStatus()}%*%= %1* %P %L %l %*'
endf

func! Err_num()
    let info = get(b:, 'coc_diagnostic_info', {})
    return 'E' . get(info, 'error', 0)
endf

func! GitStatus()
    let head = fugitive#head()
    let [a, m, r] = GitGutterGetHunkSummary()
    return len(head) ? printf(' %s +%d ~%d -%d ', head, a, m, r) : ''
endf

func! SetTabline()
    let &tabline = '%1* BUFFER %*'
    let i = 1
    while i <= bufnr('$')
        if bufexists(i) && buflisted(i) 
            let &tabline .= '%' . i . '@Clicktab@' 
            let &tabline .= i == bufnr('%') ? ' %3* ' : ' %2* '
            let name = (len(fnamemodify(bufname(i), ':t')) ? fnamemodify(bufname(i), ':t') : '[未命名]') . (getbufvar(i, '&mod')?'+':'')
            let &tabline .=  name . ' %*%X'
        endif
        let i += 1
    endwhile
    let path = substitute(expand('%'), $PWD . '/', '', '')
    let path = substitute(path, '/Users/chenyc', '~', '')
    let path = len(path) ? path : '[未命名]'
    let &tabline .= ' %<%=%1* ' . path .' %*'
    return ''
endf

func! Clicktab(minwid, clicks, button, modifiers) abort
    if a:clicks == 1 && a:button is# 'l'
        silent execute 'buffer' a:minwid
    endif
endf
