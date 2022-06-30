vnoremap <silent><buffer> C :<c-u>call <SID>console()<cr>
vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("/** ", " */")<cr>

func s:console()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 2]
    let l = line('.')
    let space = substitute(getline(l), '\v(^\s*).*', '\1', '')

    call appendbufline('%', line('.'), printf(space . 'print(%s)', tag))
endf
