augroup markdown
    au!
    au FileType markdown setlocal shiftwidth=2
    au FileType markdown setlocal softtabstop=2
    au FileType markdown setlocal tabstop=2
    au FileType markdown nnoremap <buffer> <CR> :call <SID>toggleTodoStatus()<CR>
augroup END

func! s:toggleTodoStatus()
    let line = getline('.')
    if line =~ glob2regpat('*- \[ \]*')
        call setline('.', substitute(line, '\[ \]', '[x]', ''))
    elseif line =~ glob2regpat('*- \[x\]*')
        call setline('.', substitute(line, '\[x\]', '[ ]', ''))
    endif
    exe "norm! j^"
endf
