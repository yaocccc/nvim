augroup vue
    au!
    autocmd BufWritePre *.vue :call CocAction('format')
augroup END

vnoremap <silent><buffer> C :<c-u>call <SID>console()<cr>

func s:console()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 2]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')

    call appendbufline('%', line('.'), printf(space . 'console.log(%s)', tag))
endf
