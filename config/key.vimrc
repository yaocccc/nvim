" common
    " 设置s t 无效 ;=: ,重复上一次宏操作
        map s <nop>
        map ; :
        map ! :!
        nnoremap + <c-a>
        nnoremap _ <c-x>
        nnoremap , @@
        
    " 只删除 不复制
        nnoremap x "_x
        xnoremap <BS> "_d
        snoremap <BS> <c-g>"_dd

    " S保存 Q退出 R重载vim配置 jj=esc
        nnoremap <silent> S :w<CR>
        nnoremap <silent> Q :q!<CR>
        nnoremap <silent> R :source ~/.config/nvim/init.vim<CR>
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

    " CTRL SHIFT + 方向 快速跳转
        nnoremap <c-s-up>    10k
        nnoremap <c-s-down>  10j
        nnoremap <c-s-left>  ^
        nnoremap <c-s-right> $
        inoremap <c-s-up>    <c-r>=Exec('norm! k')<CR>
        inoremap <c-s-down>  <c-r>=Exec('norm! j')<CR>
        inoremap <c-s-left>  <c-r>=Exec('norm! ^')<CR>
        inoremap <c-s-right> <c-r>=Exec('norm! $')<CR>
        vnoremap <c-s-up>    10k
        vnoremap <c-s-down>  10j
        vnoremap <c-s-left>  ^
        vnoremap <c-s-right> $

    " 选中全文
        nnoremap å ggVG

    " 0和tab 在 () 和 行首行尾切换
        nnoremap <expr><tab> len(getline('.')) == col('.') ? '^': '$'
        nnoremap 0 %

    " ctrl u 清空一行
        nnoremap <c-u> cc<Esc>
        inoremap <c-u> <Esc>cc

    " alt kj 上下移动行
        nnoremap <silent> ∆ :m .+1<CR>
        nnoremap <silent> ˚ :m .-2<CR>
        inoremap <silent> ∆ <Esc>:m .+1<CR>i
        inoremap <silent> ˚ <Esc>:m .-2<CR>i
        xnoremap <silent> ∆ :m '>+1<CR>gv
        xnoremap <silent> ˚ :m '<-2<CR>gv
        snoremap <silent> ∆ <c-g>:m '>+1<CR>gv
        snoremap <silent> ˚ <c-g>:m '<-2<CR>gv

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

" windows
    " su 新左右窗口 SU新上下窗口 sc关闭当前 so关闭其他 s方向切换
        " 新左右分窗
        nnoremap su :vsp<CR>
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
    " sv sh窗口横竖切换
        nnoremap sh <c-w>t<c-w>H
        nnoremap sv <c-w>t<c-w>K

" buffers
    " 跳转到下个
        nnoremap <silent> sn :bn<CR>
    " 跳转到上个
        nnoremap <silent> sp :bp<CR>
    " 和上一个切换
        nnoremap <silent> ss :bn<CR>
    " 删除当前buffer
        nnoremap <silent> sd :call <SID>delbuf()<CR>

        func! s:delbuf()
            :bd
            call SetTabline()
        endf
