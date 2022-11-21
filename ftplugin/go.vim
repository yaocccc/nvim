augroup golang
    au!
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufWritePre *.go :call CocAction('format')
augroup END

vnoremap <silent><buffer> F :<c-u>call <SID>gfor()<cr>jo
vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("/** ", " */")<cr>

func s:gfor()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 2]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')

    call appendbufline('%', line('.'), printf(space . 'for idx := range %s {', tag))
    call appendbufline('%', line('.') + 1, printf(space . '    %s := %s[idx]', tag[:-2], tag))
    call appendbufline('%', line('.') + 2, space . '}')
    execute 'norm! j'
endf
