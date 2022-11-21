augroup vue
    au!
    autocmd BufWritePre *.vue :call CocAction('format')
augroup END
