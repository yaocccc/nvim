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


" 快速注释
    nnoremap <silent> ?? :<c-u>call <SID>COM(line("."), line("."))<CR>
    xnoremap <silent> /  :<c-u>call <SID>COM(line("'<"), line("'>"))<CR>
    snoremap <silent> /  <c-g>:<c-u>call <SID>COM(line("'<"), line("'>"))<CR>

    func! s:COM(num1, num2)
        let com = s:getCom()
        let firstC = getline(a:num1)[0]
        for num in range(a:num1, a:num2)
            let line = com[0] == firstC ? substitute(getline(num), '^'.com, '', 'g') : substitute(getline(num), '^', com, 'g')
            call setline(num, line)
        endfor
    endf

    func! s:getCom()
        if expand('%:e') == 'vim' || expand('%:e') == 'vimrc'
            return '"'
        elseif expand('%:e') == 'zsh' || expand('%:e') == 'zshrc'
            return '#'
        endif
        return '//'
    endf


" 快速添加、去除、修改pairs
    nnoremap <silent> ys :call <SID>addPairs()<CR>
    nnoremap <silent> ds :call <SID>delPairs()<CR>
    nnoremap <silent> cs :call <SID>changePairs()<CR>
    func! s:addPairs()
        let [left, right] = s:getLR()
        if [left, right] != [0, 0]
            exe 'norm! wbi' . left
            exe 'norm! ea' . right
        endif
    endf
    func! s:delPairs()
        let [left, right] = s:getLR()
        if [left, right] != [0, 0]
            exe 'norm! F' . left . 'xf' . right . 'x'
        endif
    endf
    func! s:changePairs()
        let [left, right] = s:getLR()
        let [left2, right2] = s:getLR()
        redraw!
        if [left, right] != [0, 0] && [left2, right2] != [0, 0]
            exe 'norm! F' . left . 'r' . left2 . 'f' . right . 'r' . right2
        endif
    endf
    func! s:getLR()
        echo '-- '
        let c = getchar()
        let c = c =~ '^\d\+$' ? nr2char(c) : ''
        let leftlist = ['(', '[', '{', '<', '"', "\'", '`']
        let rightlist = [')', ']', '}', '>', '"', "\'", '`']
        let [left, right] = [0, 0]
        let lindex = index(leftlist, c)
        let rindex = index(rightlist, c)
        if lindex != -1
            let left = c
            let right = rightlist[lindex]
        elseif rindex != -1
            let left = leftlist[rindex]
            let right = c
        endif
        return [left, right]
    endf
