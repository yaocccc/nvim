setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
nnoremap <silent><buffer> <CR> :call <SID>toggleTodoStatus()<CR>
vnoremap <silent><buffer> B      :<c-u>call SurroundVaddPairs("**", "**")<cr>
vnoremap <silent><buffer> I      :<c-u>call SurroundVaddPairs("*", "*")<cr>
vnoremap <silent><buffer> T      :<c-u>call SurroundVaddPairs("- [ ] ", "")<cr>
vnoremap <silent><buffer> `      :<c-u>call SurroundVaddPairs("```", "```")<cr>

fun! s:toggleTodoStatus()
    let line = getline('.')
    if line =~ glob2regpat('*- \[ \]*')
        call setline('.', substitute(line, '\[ \]', '[x]', ''))
    elseif line =~ glob2regpat('*- \[x\]*')
        call setline('.', substitute(line, '\[x\]', '[ ]', ''))
    endif
    exe "norm! j^"
endf
