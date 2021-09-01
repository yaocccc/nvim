au FileType markdown syn match markdownError "\w\@<=\w\@="

let b:md_block = '```'
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2
nnoremap <silent><buffer> <CR> :call <SID>toggleTodoStatus()<CR>
vnoremap <silent><buffer> B      :<c-u>call SurroundVaddPairs("**", "**")<cr>
vnoremap <silent><buffer> I      :<c-u>call SurroundVaddPairs("*", "*")<cr>
vnoremap <silent><buffer> T      :<c-u>call SurroundVaddPairs("- [ ] ", "")<cr>
vnoremap <silent><buffer> `      :<c-u>call SurroundVaddPairs("```plaintext", "```")<cr>

fun! s:toggleTodoStatus()
    let line = getline('.')
    if line =~ glob2regpat('*- \[ \]*')
        call setline('.', substitute(line, '\[ \]', '[x]', ''))
    elseif line =~ glob2regpat('*- \[x\]*')
        call setline('.', substitute(line, '\[x\]', '[ ]', ''))
    endif
    exe "norm! j^"
endf

nnoremap <silent><buffer> <F6> :call <SID>toggleMPTheme()<CR>
inoremap <silent><buffer> <F6> <ESC>:call <SID>toggleMPTheme()<CR>
fun! s:toggleMPTheme()
    if g:mkdp_preview_options.theme == 'dark'
        let g:mkdp_preview_options.theme = 'light'
    else
        let g:mkdp_preview_options.theme = 'dark'
    endif

    exec 'MarkdownPreviewStop'
    exec 'MarkdownPreview'
endf
