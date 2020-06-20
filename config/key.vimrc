" common
    " 设置s t 无效 ;=: ,重复上一次宏操作
        map s <nop>
        map t <nop>
        map ; :
        map ! :!
        nnoremap , @@
        nnoremap + <c-a>
        nnoremap _ <c-x>

    " 只删除 不复制
        nnoremap x "_x
        xnoremap <BS> "_d
        snoremap <BS> <c-g>"_dd

    " S保存 Q退出 R重载vim配置 jj=esc
        nnoremap S :w<CR>
        nnoremap Q :q!<CR>
        nnoremap R :source ~/.config/nvim/init.vim<CR>
        nnoremap Y y$
        inoremap jj <Esc>

    " 重写Shift + 左右
        xnoremap <s-right> e
        imap <s-right> <esc>ea

    " SELECT模式快捷键
        snoremap y <c-g>y
        snoremap d <c-g>d
        snoremap c <c-g>c
        snoremap x <c-g>x
        snoremap p <c-g>"_dP
        xnoremap p "_dP

    " VISUAL SELECT模式 s-tab tab左右缩进"
        xnoremap < <gv
        xnoremap > >gv
        snoremap < <c-g><gv
        snoremap > <c-g>>gv"
        xnoremap <s-tab> <gv
        xnoremap <tab> >gv
        snoremap <s-tab> <c-g><gv
        snoremap <tab> <c-g>>gv

    " SHIFT + 方向 选择文本
        inoremap <s-up> <esc>vk
        inoremap <s-down> <esc>vj
        nnoremap <s-up> Vk
        nnoremap <s-down> Vj
        xnoremap <s-up> k
        xnoremap <s-down> j
        snoremap <s-up> <esc>Vk
        snoremap <s-down> <esc>Vj
        nnoremap <s-left> vh
        nnoremap <s-right> vl

    " 快速跳转
        noremap <leader>h 8h
        noremap <leader>l 8l
        noremap <leader>j :+15<CR>
        noremap <leader>k :-16<CR>
        noremap <leader><Left> 8h
        noremap <leader><Right> 8l
        noremap <leader><Down> :+15<CR>
        noremap <leader><Up> :-16<CR>

    " 复制全文
        nnoremap <leader>y :%yank<CR>

    " 0和tab 在 () 和 行首行尾切换
        nnoremap <expr><tab> len(getline('.')) == col('.') ? '^': '$'
        nnoremap 0 %

    " ctrl u 清空一行
        nnoremap <c-u> cc<Esc>
        inoremap <c-u> <Esc>cc

    " alt kj 上下移动行
        nnoremap ∆ :m .+1<CR>
        nnoremap ˚ :m .-2<CR>
        inoremap ∆ <Esc>:m .+1<CR>i
        inoremap ˚ <Esc>:m .-2<CR>i
        xnoremap ∆ :m '>+1<CR>gv
        xnoremap ˚ :m '<-2<CR>gv
        snoremap ∆ <c-g>:m '>+1<CR>gv
        snoremap ˚ <c-g>:m '<-2<CR>gv

    " alt + key 跳转
        " H 跳转到 句首
        inoremap ˙ <c-r>=Exec('norm! 0')<CR>
        " L 跳转到 句尾
        inoremap ¬ <Esc>A
        " w 跳转到 上个词首
        inoremap ∑ <c-r>=Exec('norm! w')<CR>
        " b 跳转到 下个词首
        inoremap ∫ <c-r>=Exec('norm! b')<CR>
        " d 修改当前词
        inoremap ∂ <Esc>ciw
        inoremap ® <Esc>ciw
        " o 新增行
        inoremap ø <Esc>o
        " O 往上新增行
        inoremap Ø <Esc>O
        " H 跳转到 句首
        nnoremap ˙ I
        " L 跳转到 句尾
        nnoremap ¬ A
        " w 跳转到 上个词首
        nnoremap ∑ <Right>wi
        " b 跳转到 下个词首
        nnoremap ∫ bi
        " d 删除当前词
        nnoremap ∂ diw
        " r 修改当前词
        nnoremap ® ciw


    " s v模式下  /注释
    " n  模式下 ?? 注释
    " 实现原理: 光标所在行的第一位  是/则代表 当前已注释 则将 ^// 替换为空
    "           光标所在行的第一位不是/则代表 当前为注释 则将 ^   替换为//
        snoremap <expr>/ (getline('.')[0]=='/')?'<c-g>:s/^\/\//<CR>:set nohlsearch<CR>':'<c-g>:s/^/\/\//<CR>:set nohlsearch<CR>'
        xnoremap <expr>/ (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'
        nnoremap <expr>?? (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'

    " 光标在{}上时折叠{}，否则切换折叠
    " 实现原理: 光标所在位如果为{ 则折叠 {}，如果所在位为折叠，则展开
        nnoremap <expr>-- foldclosed(line('.'))*((getline('.')[col('.')-1]=='{')+(getline('.')[col('.')-1]=='}'))<0?'zfa{':'za'

    " VISUAL SELECT模式下 -折叠
        xnoremap - zf
        snoremap - <c-v>zf

    " 折叠非匹配内容
        nnoremap -/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

    " 快速添加pairs
        snoremap ' <c-g>di''<esc>P
        snoremap " <c-g>di""<esc>P
        snoremap { <c-g>di{}<esc>P
        snoremap } <c-g>di{}<esc>P
        snoremap [ <c-g>di[]<esc>P
        snoremap ] <c-g>di[]<esc>P
        snoremap ( <c-g>di()<esc>P
        snoremap ) <c-g>di()<esc>P
        xnoremap ' di''<esc>P
        xnoremap " di""<esc>P
        xnoremap { di{}<esc>P
        xnoremap } di{}<esc>P
        xnoremap [ di[]<esc>P
        xnoremap ] di[]<esc>P
        xnoremap ( di()<esc>P
        xnoremap ) di()<esc>P

    " F5 一键运行js ts代码
        map <F5> :call RunFile()<CR>
        func!RunFile()
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
        endfunc

" windows
    " su 新左右窗口 SU新上下窗口 sc关闭当前 so关闭其他 s方向切换
        " 新左右分窗
        nnoremap su :vsp<CR>
        " 新上下分窗
        nnoremap SU :sp<CR>
        " 新上下分窗
        nnoremap Su :sp<CR>
        " 关闭当前window
        nnoremap sc :close<CR>
        " 仅保留当前window
        nnoremap so :only<CR>
        " 切换到左
        nnoremap s<Left> <c-w>h
        " 切换到右
        nnoremap s<Right> <c-w>l
        " 切换到上
        nnoremap s<Up> <c-w>k
        " 切换到下
        nnoremap s<Down> <c-w>j
        " 切换到左
        nnoremap sh <c-w>h
        " 切换到右
        nnoremap sl <c-w>l
        " 切换到上
        nnoremap sk <c-w>k
        " 切换到下
        nnoremap sj <c-w>j
        " 窗口大小一致
        nnoremap s= <c-w>=
        " 窗口大小左右变大
        nnoremap s. <c-w>10>
        " 窗口大小左右变小
        nnoremap s, <c-w>10<
        " 窗口大小上下变大
        nnoremap S> <c-w>10+
        " 窗口大小上下变小
        nnoremap S< <c-w>10-
    " sv sh窗口横竖切换
        nnoremap sh <c-w>t<c-w>H
        nnoremap sv <c-w>t<c-w>K

" buffers
    " 跳转到下个
        nnoremap sn :bn<CR>
        nnoremap T  :b#<CR>
    " 跳转到上个
        nnoremap sp :bp<CR>
    " 和上一个切换
        nnoremap ss :bn<CR>
    " 删除当前buffer
        nnoremap sd :bd<CR>
