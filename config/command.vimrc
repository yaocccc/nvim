" 一键运行文件
    command! Run call <SID>runFile()
    noremap <F5> :Run<CR>
    inoremap <F5> <ESC>:Run<CR>

    func! s:runFile()
        exec "w"
        if &filetype == 'javascript'
            exec 'w !node %'
        elseif &filetype == 'typescript'
            exec 'w !ts-node %'
        elseif &filetype == 'python'
            exec 'w !python %'
        elseif &filetype == 'go'
            exec 'w !go run %'
        endif
    endf


" 重设tab长度
    command! -nargs=* SetTab call <SID>switchTab(<q-args>)
    func! s:switchTab(tab_len)
        if !empty(a:tab_len)
            let &shiftwidth = a:tab_len
            let &softtabstop= a:tab_len
            let &tabstop = a:tab_len
        else
            let tab_len = input('input shiftwidth: ')
            if empty(tab_len)
                redraw!
                return
            endif
            let &shiftwidth = tab_len
            let &softtabstop= tab_len
            let &tabstop = tab_len
            redraw!
        endif
        echo printf('shiftwidth: %d', &shiftwidth)
    endf
