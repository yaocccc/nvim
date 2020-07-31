" common
    " 设置s t 无效 ;=: ,重复上一次宏操作
        map s <nop>
        map ; :
        map ! :!
        nnoremap + <c-a>
        nnoremap _ <c-x>
        nnoremap , @@
        
    " c-s = :%s/
        nnoremap <c-s>    :<c-u>%s/\v//gc<left><left><left><left>

    " 只删除
        xnoremap          <BS>       "_d
        snoremap          <BS>  <c-g>"_d
        nnoremap          x          "_x
        xnoremap <silent> p          :<c-u>exe col("'>") == col("$") ? 'norm! gv"_dp' : 'norm! gv"_dP'<cr>
        snoremap <silent> p     <c-g>:<c-u>exe col("'>") == col("$") ? 'norm! gv"_dp' : 'norm! gv"_dP'<cr>

    " S保存 Q退出 R重载vim配置 jj=esc
        nnoremap <silent> S  :w<CR>
        nnoremap <silent> Q  :q!<CR>
        nnoremap <silent> R  :source ~/.config/nvim/init.vim<CR>:echo 'config reloaded'<CR>
        nnoremap          Y  y$
        inoremap          jj <Esc>l

    " 重写Shift + 左右
        xnoremap <s-right> e
        inoremap <s-right> <esc>ea

    " SELECT模式快捷键
        snoremap y <c-g>y
        snoremap d <c-g>d
        snoremap c <c-g>c
        snoremap x <c-g>x

    " VISUAL SELECT模式 s-tab tab左右缩进
        xnoremap <       <gv
        xnoremap >       >gv
        snoremap <       <c-g><gv
        snoremap >       <c-g>>gv"
        xnoremap <s-tab> <gv
        xnoremap <tab>   >gv
        snoremap <s-tab> <c-g><gv
        snoremap <tab>   <c-g>>gv

    " SHIFT + 方向 选择文本
        inoremap <s-up>    <esc>vk
        inoremap <s-down>  <esc>vj
        nnoremap <s-up>    Vk
        nnoremap <s-down>  Vj
        xnoremap <s-up>    k
        xnoremap <s-down>  j
        snoremap <s-up>    <esc>Vk
        snoremap <s-down>  <esc>Vj
        nnoremap <s-left>  vh
        nnoremap <s-right> vl

    " CTRL SHIFT + 方向 快速跳转
        inoremap <silent> <c-s-up>    <up><up><up><up><up><up><up><up><up><up>
        inoremap <silent> <c-s-down>  <down><down><down><down><down><down><down><down><down><down>
        inoremap <silent> <c-s-left>  <home>
        inoremap <silent> <c-s-right> <end>
        nnoremap          <c-s-up>    10k
        nnoremap          <c-s-down>  10j
        nnoremap          <c-s-left>  ^
        nnoremap          <c-s-right> $
        vnoremap          <c-s-up>    10k
        vnoremap          <c-s-down>  10j
        vnoremap          <c-s-left>  ^
        vnoremap          <c-s-right> $

    " 选中全文
        nnoremap <m-a>     ggVG
        nnoremap <leader>y :%yank<CR>

    " 0和tab 在 () 和 行首行尾切换
        nnoremap <expr><tab> col('$') - 1 == col('.') ? '^': '$'
        nnoremap 0 %
        vnoremap 0 %

    " ctrl u 清空一行
        nnoremap <c-u> cc<Esc>
        inoremap <c-u> <Esc>cc

    " alt kj 上下移动行
        nnoremap <silent> <m-j> :m .+1<CR>
        nnoremap <silent> <m-k> :m .-2<CR>
        inoremap <silent> <m-j> <Esc>:m .+1<CR>i
        inoremap <silent> <m-k> <Esc>:m .-2<CR>i
        xnoremap <silent> <m-j> :m '>+1<CR>gv
        xnoremap <silent> <m-k> :m '<-2<CR>gv
        snoremap <silent> <m-j> <c-g>:m '>+1<CR>gv
        snoremap <silent> <m-k> <c-g>:m '<-2<CR>gv

    " alt + key 操作
        inoremap <m-d> <Esc>ciw
        inoremap <m-r> <Esc>ciw
        inoremap <m-o> <Esc>o
        inoremap <m-O> <Esc>O
        nnoremap <m-d> diw
        nnoremap <m-r> ciw

" windows
    " su 新左右窗口 sc关闭当前 so关闭其他 s方向切换
        nnoremap su       :vsp<CR>
        nnoremap sc       :close<CR>
        nnoremap so       :only<CR>
        nnoremap s<Up>    <c-w>k
        nnoremap s<Down>  <c-w>j
        nnoremap s<Left>  <c-w>h
        nnoremap s<Right> <c-w>l
        nnoremap sk       <c-w>k
        nnoremap sj       <c-w>j
        nnoremap sh       <c-w>h
        nnoremap sl       <c-w>l
        " 窗口大小一致
        nnoremap s= <c-w>=
        " 窗口大小左右变大
        nnoremap s. <c-w>10>
        " 窗口大小左右变小
        nnoremap s, <c-w>10<

" buffers
        nnoremap <silent> ss :bn<CR>
        nnoremap <silent> sn :bn<CR>
        nnoremap <silent> sp :bp<CR>
        nnoremap <silent> sd :call <SID>delbuf()<CR>
        func! s:delbuf()
            :bd
            call SetTabline()
        endf

" 一键运行文件
    command! Run  call <SID>runFile()
    noremap  <F5> :Run<CR>
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
            let [&shiftwidth, &softtabstop, &tabstop] = [a:tab_len, a:tab_len, a:tab_len]
        else
            let tab_len = input('input shiftwidth: ')
            if empty(tab_len)
                redraw!
                return
            endif
            let [&shiftwidth, &softtabstop, &tabstop] = [tab_len, tab_len, tab_len]
            redraw!
        endif
        echo printf('shiftwidth: %d', &shiftwidth)
    endf

" 折叠
    nnoremap <silent> <expr> -- foldclosed(line('.')) == -1 ? ':call <SID>fold()<cr>' : 'za'
    xnoremap - zf
    snoremap - <c-v>zf
    func! s:fold()
        let line = trim(getline('.'))
        if line == ''
            return
        endif
        let [up, down] = [0, 0]
        if line[0] == '}'
            exe 'norm! ^%'
            let up = line('.')
            exe 'norm! %'
        endif
        if line[len(line) - 1] == '{'
            exe 'norm! $%'
            let down = line('.')
            exe 'norm! %'
        endif
        if up != 0 && down != 0
            exe 'norm! ' . up . 'GV' . down . 'Gzf'
        elseif up != 0
            exe 'norm! V' . up . 'Gzf'
        elseif down != 0
            exe 'norm! V' . down . 'Gzf'
        endif
    endf
