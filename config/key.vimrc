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
        nnoremap <bs>  "_ciw
        inoremap <expr> <c-h> col('.') == col('$') ? '<esc>"_db"_xa' : '<esc>"_db"_xi'

    " 打断,
        nnoremap <c-j> f,a<cr><esc>
        inoremap <c-j> <esc>f,a<cr>

    " cmap
        cnoremap <c-a> <home>
        cnoremap <c-e> <end>
        cnoremap <up> <c-p>
        cnoremap <down> <c-n>

    " c-s = :%s/
        nnoremap <c-s>    :<c-u>%s/\v//gc<left><left><left><left>
        vnoremap <c-s>          :s/\v//gc<left><left><left><left>

    " only change text
        vnoremap          <BS>       "_d
        nnoremap          x          "_x
        vnoremap          x          "_x
        nnoremap          Y           y$
        vnoremap          c          "_c
        vnoremap          p          pgvy
        vnoremap          p          Pgvy

    " S保存 Q退出 R重载vim配置
        command! W w !sudo tee > /dev/null %
        au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif
        nnoremap <silent><expr> S &buftype == 'acwrite' ? ':W<CR>' : ':w<CR>'
        nnoremap <silent> Q     :q!<cr>
        nnoremap <silent> R     :source ~/.config/nvim/init.vim \| echo "reloaded"<cr>

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

    " 选中全文 选中{ 复制全文
        nnoremap <m-a>     ggVG
        nnoremap <m-s>     vi{
        nnoremap <leader>y :%yank<cr>

    " ctrl u 清空一行
        nnoremap <c-u> cc<Esc>
        inoremap <c-u> <Esc>cc

    " alt + 上 下移动行
        nnoremap <silent> <m-up>   :m .-2<cr>
        nnoremap <silent> <m-down> :m .+1<cr>
        inoremap <silent> <m-up>   <Esc>:m .-2<cr>i
        inoremap <silent> <m-down> <Esc>:m .+1<cr>i
        vnoremap <silent> <m-up>   :m '<-2<cr>gv
        vnoremap <silent> <m-down> :m '>+1<cr>gv

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
        nnoremap s<Up>    <c-w>k
        nnoremap s<Down>  <c-w>j
        nnoremap <m-w>    <c-w>w
        nnoremap s=       <c-w>=
        nnoremap s.       <c-w>10>
        nnoremap s,       <c-w>10<

" buffers
        nnoremap <silent> W         :bd<cr>
        nnoremap <silent> ss        :bn<cr>
        nnoremap <silent> sp        :bp<cr>
        nnoremap <silent> <m-left>  :bp<cr>
        nnoremap <silent> <m-right> :bn<cr>
        vnoremap <silent> <m-left>  <esc>:bp<cr>
        vnoremap <silent> <m-right> <esc>:bn<cr>
        inoremap <silent> <m-left>  <esc>:bp<cr>
        inoremap <silent> <m-right> <esc>:bn<cr>


" T快速向下打开一个终端
        nnoremap <expr> tt ':below 10sp \| term<cr>a'
        func! TERM(cmd)
            exec 'below 10sp | term ' . a:cmd
            startinsert
        endf

" 一键运行文件
        command! Run  call <SID>runFile()
        noremap  <F5> :Run<cr>
        inoremap <F5> <ESC>:Run<cr>
        let s:run_cmd = { 'javascript': 'node', 'typescript': 'ts-node', 'html': 'google-chrome-stable', 'python': 'python', 'go': 'go run', 'sh': 'bash' }
        fun! s:runFile()
            exec "w"
            if     exists('s:run_cmd.' . &filetype) | call TERM(s:run_cmd[&filetype] . ' %')
            elseif &filetype == 'markdown' | exec 'MarkdownPreview'
            elseif &filetype == 'java' | call TERM('javac %') | call TERM('java %<')
            elseif &filetype == 'c' | call TERM('gcc % -o %< && ./%< && rm %<')
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

" 定位光标位置
        nnoremap <silent> Z :call HlCursor()<cr>
        nnoremap <silent><expr> zz 'zz:call HlCursor()<cr>'
        fun! HlCursor()
            call timer_start(500, 'ResetHlCursor')
            set cursorcolumn
            hi CursorLine ctermfg=NONE ctermbg=240 cterm=bold
        endf
        fun! ResetHlCursor(...)
            set nocursorcolumn
            hi CursorLine ctermfg=NONE ctermbg=NONE cterm=bold
        endf
