let g:currentmode={ "n": "NORMAL", "v": "VISUAL", "V": "V-LINE", "\<c-v>": "V-BLOCK", "i": "INSERT", "R": "R", "r": "R", "Rv": "V·REPLACE", "c": "COMMAND", "s": "SELECT", "t": "TERMINAL"}

au BufEnter,BufWritePost,TextChanged,TextChangedI * call SetTabline()
set statusline=%1*\ %{g:currentmode[mode()]}\ %*\ %2*\ %{Err_num()}\ %*\ %2*%{GitStatus()}%*%=\ %1*\ %P\ %L\ %l\ %*

hi User1 ctermbg=24
hi User2 ctermbg=238
hi User3 ctermbg=25

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
            let name = (len(fnamemodify(bufname(i), ':t')) ? fnamemodify(bufname(i), ':t') : '[未命名]') . (getbufvar(i, '&mod')?'+':'')
            let &tabline .= i == bufnr('%') ? (' %3* ' . name . ' %*') : (' %2* ' . name . ' %*')
        endif
        let i += 1
    endwhile
    let &tabline .= '%=%1* %f %*'
endf
