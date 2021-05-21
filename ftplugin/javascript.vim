vnoremap <buffer><silent> = :!js-beautify<cr>
nnoremap <buffer><silent> = :.!js-beautify<cr>
vnoremap <silent><buffer> C :<c-u>call <SID>console()<cr>
vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("/** ", " */")<cr>

func s:console()
    let tag = getline(line("."))[col("'<") - 1 : col("'>") - 1]
    call SurroundVaddPairs(printf('console.log("%s: ", ', tag), ');')
endf
