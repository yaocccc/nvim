augroup markdown
    au!
    au BufEnter *.md setlocal shiftwidth=2
    au BufEnter *.md setlocal softtabstop=2
    au BufEnter *.md setlocal tabstop=2
    au BufEnter *.md nnoremap <buffer> <CR> :call <SID>toggleTodoStatus()<CR>
augroup END

func! s:toggleTodoStatus()
    let line = getline('.')
    echo [line, line =~ glob2regpat('*- \[ \]*'), line =~ glob2regpat('*- \[x\]*')]
    if line =~ glob2regpat('*- \[ \]*')
        call setline('.', substitute(line, '\[ \]', '[x]', ''))
    elseif line =~ glob2regpat('*- \[x\]*')
        call setline('.', substitute(line, '\[x\]', '[ ]', ''))
    endif
    exe "norm! j^"
endf
