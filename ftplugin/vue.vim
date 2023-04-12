augroup vue
    au!
    autocmd BufWritePre *.vue :call CocAction('format')
    vnoremap <silent><buffer> D :<c-u>call SurroundVaddPairs("<!--", "--> ")<cr>
augroup END
