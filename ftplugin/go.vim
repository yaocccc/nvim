augroup golang
    au!
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufWritePre *.go :call CocAction('format')
augroup END

autocmd FileType go vnoremap <buffer><silent> = :!gofmt<cr>
autocmd FileType go nnoremap <buffer><silent> = :.!gofmt<cr>
