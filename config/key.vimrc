" common
    " 设置s t 无效 ;=: ,重复上一次宏操作
        map      s <nop>
        map      ; :
        map      ! :!
        nnoremap + <c-a>
        nnoremap _ <c-x>
        nnoremap , @@
        inoremap <c-z> <esc>u
        inoremap <c-v> <esc>pa

    " 快速删除
        nnoremap <bs>  ciw
        inoremap <expr> <c-h> col('.') == col('$') ? '<esc>"_db"_xa' : '<esc>"_db"_xi'

    " 打断,
        nnoremap <c-j> f,a<cr><esc>
        inoremap <c-j> <esc>f,a<cr>
        
    " cmap
        cnoremap <c-a> <home>
        cnoremap <c-e> <end>
        
    " c-s = :%s/
        nnoremap <c-s>    :<c-u>%s/\v//gc<left><left><left><left>
        vnoremap <c-s>          :s/\v//gc<left><left><left><left>

    " only change text
        vnoremap          <BS>       "_d
        nnoremap          x          "_x
        vnoremap          x          "_x
        nnoremap          Y           y$
        vnoremap          c          "_c
        vnoremap <silent> p          :<c-u>exe col("'>") == col("$") && SelectedIsLines() == 0 ? 'norm! gv"_dp' : 'norm! gv"_dP'<cr>
        vnoremap <silent> P          "_dP
        let SelectedIsLines = { -> col("'<") == 1 && col("'>") == len(getline(line("'>"))) + 1 }

    " S保存 Q退出 R重载vim配置 jj=esc
        command! W w !sudo tee > /dev/null %
        nnoremap <silent> S     :w<cr>
        nnoremap <silent> Q     :q!<cr>
        nnoremap <silent> R     :source ~/.config/nvim/init.vim \| echo "reloaded"<cr>
        inoremap          jj    <Esc>l

    " 重写Shift + 左右
        vnoremap <s-right>      e
        inoremap <s-right> <esc>ea

    " VISUAL SELECT模式 s-tab tab左右缩进
        vnoremap <            <gv
        vnoremap >            >gv
        vnoremap <s-tab>      <gv
        vnoremap <tab>        >gv

    " SHIFT + 方向 选择文本
        inoremap <s-up>    <esc>vk
        inoremap <s-down>  <esc>vj
        nnoremap <s-up>         Vk
        nnoremap <s-down>       Vj
        vnoremap <s-up>         k
        vnoremap <s-down>       j
        nnoremap <s-left>       vh
        nnoremap <s-right>      vl

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
        nnoremap <leader>y :%yank<cr>

    " ctrl u 清空一行
        nnoremap <c-u> cc<Esc>
        inoremap <c-u> <Esc>cc

    " alt + 上 下移动行
        nnoremap <silent><unique> <m-up>   :m .-2<cr>
        nnoremap <silent><unique> <m-down> :m .+1<cr>
        inoremap <silent><unique> <m-up>   <Esc>:m .-2<cr>i
        inoremap <silent><unique> <m-down> <Esc>:m .+1<cr>i
        vnoremap <silent><unique> <m-up>   :m '<-2<cr>gv
        vnoremap <silent><unique> <m-down> :m '>+1<cr>gv

    " alt + key 操作
        inoremap <m-d> <Esc>"_ciw
        inoremap <m-r> <Esc>"_ciw
        inoremap <m-o> <Esc>o
        inoremap <m-O> <Esc>O
        nnoremap <m-d>      "_diw
        nnoremap <m-r>      "_ciw

" windows
    " su 新左右窗口 sc关闭当前 so关闭其他 s方向切换
        nnoremap su       :vsp<cr>
        nnoremap sc       :close<cr>
        nnoremap so       :only<cr>
        nnoremap s<Left>  <c-w>h
        nnoremap s<Right> <c-w>l
        nnoremap s<Up>    <c-w>K
        nnoremap s<Down>  <c-w>j
        nnoremap <m-w>    <c-w>w
        nnoremap s=       <c-w>=
        nnoremap s.       <c-w>10>
        nnoremap s,       <c-w>10<

" buffers
        nnoremap <silent> ss        :bn<cr>
        nnoremap <silent> sp        :bp<cr>
        nnoremap <silent> <m-left>  :bp<cr>
        nnoremap <silent> <m-right> :bn<cr>
        vnoremap <silent> <m-left>  <esc>:bp<cr>
        vnoremap <silent> <m-right> <esc>:bn<cr>
        inoremap <silent> <m-left>  <esc>:bp<cr>
        inoremap <silent> <m-right> <esc>:bn<cr>
        nnoremap <silent><expr> W   ":bd \|call SetTabline()<cr>"

" 一键运行文件
    command! Run  call <SID>runFile()
    noremap  <F5> :Run<cr>
    inoremap <F5> <ESC>:Run<cr>
    fun! s:runFile()
        exec "w"
        if     &filetype == 'javascript' | exec 'w !node %'
        elseif &filetype == 'typescript' | exec 'w !ts-node %'
        elseif &filetype == 'python' | exec 'w !python %'
        elseif &filetype == 'go' | exec 'w !go run %'
        elseif &filetype == 'java' | exec 'w !javac %' | exec 'w !java %<'
        elseif &filetype == 'markdown' | exec 'MarkdownPreview'
        elseif &filetype == 'c' | exec 'w !gcc % -o ' . expand('%:r') . ' && ./' . expand('%:r') . ' && rm ./' . expand('%:r')
        elseif &filetype == 'sh' | exec 'w !./%'
        endif
    endf

" 重设tab长度
    command! -nargs=* SetTab call <SID>switchTab(<q-args>)
    fun! s:switchTab(tab_len)
        if !empty(a:tab_len)
            let [&shiftwidth, &softtabstop, &tabstop] = [a:tab_len, a:tab_len, a:tab_len]
        else
            let l:tab_len = input('input shiftwidth: ')
            if !empty(l:tab_len)
                let [&shiftwidth, &softtabstop, &tabstop] = [l:tab_len, l:tab_len, l:tab_len]
            endif
        endif
        redraw!
        echo printf('shiftwidth: %d', &shiftwidth)
    endf

" 折叠
    nnoremap <silent><expr> -- foldclosed(line('.')) == -1 ? ':call <SID>fold()<cr>' : 'za'
    vnoremap - zf
    fun! s:fold()
        let l:line = trim(getline('.'))
        if l:line == '' | return | endif
        let [l:up, l:down] = [0, 0]
        if l:line[0] == '}'
            exe 'norm! ^%'
            let l:up = line('.')
            exe 'norm! %'
        endif
        if l:line[len(l:line) - 1] == '{'
            exe 'norm! $%'
            let l:down = line('.')
            exe 'norm! %'
        endif
        try
            if l:up != 0 && l:down != 0
                exe 'norm! ' . l:up . 'GV' . l:down . 'Gzf'
            elseif l:up != 0
                exe 'norm! V' . l:up . 'Gzf'
            elseif l:down != 0
                exe 'norm! V' . l:down . 'Gzf'
            else
                exe 'norm! za'
            endif
        catch
            redraw!
        endtry
    endf

" space 行首行尾切换
    nnoremap <silent> <space> :call <SID>move()<cr>
    nnoremap 0 %
    vnoremap 0 %

    fun! s:move()
        let [l:first, l:head] = [1, len(getline('.')) - len(substitute(getline('.'), '^\s*', '', 'g')) + 1]
        let l:before = col('.')
        exe l:before == l:first && l:first != l:head ? 'norm! ^' : 'norm! $'
        let l:after = col('.')
        if l:before == l:after
            exe 'norm! 0'
        endif
    endf
