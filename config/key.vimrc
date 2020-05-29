" 设置s t 无效
    map s <nop>
    map t <nop>

" S保存 Q退出 R重载vim配置 jj esc
    nnoremap S :w<CR>
    nnoremap Q :q!<CR>
    nnoremap R :source ~/.config/nvim/init.vim<CR>
    inoremap jj <Esc>

" SELECT模式快捷键
    snoremap y <c-v>vy
    snoremap d <c-v>vd
    snoremap c <c-v>vc
    snoremap x <c-v>vx
    snoremap p <c-v>vp

" VISUAL SELECT模式 s-tab tab左右缩进"
    vnoremap < <gv
    vnoremap > >gv
    snoremap < <c-v>v<gv
    snoremap > <c-v>v>gv"

    vnoremap <s-tab> <gv
    vnoremap <tab> >gv
    snoremap <s-tab> <c-v>v<gv
    snoremap <tab> <c-v>v>gv

" ,重复上一次宏操作
    nnoremap , @@

" SHIFT + 方向 选择文本
	nnoremap <silent><s-left> vh
	nnoremap <silent><s-right> vl
	nnoremap <silent><s-up> Vk
	nnoremap <silent><s-down> Vj
	vnoremap <silent><s-up> k
	vnoremap <silent><s-down> j
	snoremap <silent><s-up> <esc>Vk
	snoremap <silent><s-down> <esc>Vj

" 快速跳转
    noremap <silent><leader>h 8h
    noremap <silent><leader>l 8l
    noremap <silent><leader>j :+15<CR>
    noremap <silent><leader>k :-16<CR>
    noremap <silent><leader><Left> 8h
    noremap <silent><leader><Right> 8l
    noremap <silent><leader><Down> :+15<CR>
    noremap <silent><leader><Up> :-16<CR>

" 0和tab 在 () 和 行首行尾切换
    nnoremap <expr><tab> len(getline('.')) == col('.') ? '^': '$'
    nnoremap 0 %

" ctrl u 清空一行
    nnoremap <c-u> cc<Esc>
    inoremap <c-u> <Esc>cc

" buffers
    " 跳转到下个
        nnoremap <silent> bn :bn<CR>
    " 跳转到上个
        nnoremap <silent> bp :bp<CR>
    " 和上一个切换
        nnoremap <silent> bb :b#<CR>
    " 删除当前buffer
        nnoremap <silent> bd :bd<CR>

" windows
    " su 新左右窗口 SU新上下窗口 sc关闭当前 so关闭其他 s方向切换
        " 新左右分窗
            nnoremap <silent>su :vsp<CR>
        " 新上下分窗
            nnoremap <silent>SU :sp<CR>
        " 新上下分窗
            nnoremap <silent>Su :sp<CR>
        " 关闭当前window
            nnoremap <silent>sc :close<CR>
        " 仅保留当前window
            nnoremap <silent>so :only<CR>
        " 切换到左
            nnoremap <silent>s<Left> <c-w>h
        " 切换到右
            nnoremap <silent>s<Right> <c-w>l
        " 切换到上
            nnoremap <silent>s<Up> <c-w>k
        " 切换到下
            nnoremap <silent>s<Down> <c-w>j
        " 切换到左
            nnoremap <silent>sh <c-w>h
        " 切换到右
            nnoremap <silent>sl <c-w>l
        " 切换到上
            nnoremap <silent>sk <c-w>k
        " 切换到下
            nnoremap <silent>sj <c-w>j
        " 窗口大小一致
            nnoremap <silent>s= <c-w>=
        " 窗口大小左右变大
            nnoremap <silent>s. <c-w>10>
        " 窗口大小左右变小
            nnoremap <silent>s, <c-w>10<
        " 窗口大小上下变大
            nnoremap <silent>S> <c-w>10+
        " 窗口大小上下变小
            nnoremap <silent>S< <c-w>10-
    " sv sh窗口横竖切换
        nnoremap <silent>sh <c-w>t<c-w>H
        nnoremap <silent>sv <c-w>t<c-w>K

" tabs
    " tu新建标签页 tn tp切换标签 tc关闭 to关闭其他 t数字跳到对应tab
        " 切换tab
            nnoremap <silent>T gt<CR>
        " 创建tab
            nnoremap <silent>tu :tabe<CR>
        " 跳转到下个tab
            nnoremap <silent>tn :+tabnext<CR>
        " 跳转到上个tab
            nnoremap <silent>tp :-tabnext<CR>
        " 关闭当前tab
            nnoremap <silent>tc :tabc<CR>
        " 仅保留当前tab
            nnoremap <silent>to :tabo<CR>
        " 跳转到第1个tab
            nnoremap <silent>t1 1gt
        " 跳转到第2个tab
            nnoremap <silent>t2 2gt
        " 跳转到第3个tab
            nnoremap <silent>t3 3gt
        " 跳转到第4个tab
            nnoremap <silent>t4 4gt
        " 跳转到第5个tab
            nnoremap <silent>t5 5gt
        " 跳转到第6个tab
            nnoremap <silent>t6 6gt
        " 跳转到第7个tab
            nnoremap <silent>t7 7gt
        " 跳转到第8个tab
            nnoremap <silent>t8 8gt
        " 跳转到第9个tab
            nnoremap <silent>t9 9gt
        " 跳转到最后一个tab
            nnoremap <silent>t0 :tablast<CR>

" alt kj 上下移动行
    nnoremap <silent>∆ :m .+1<CR>
    nnoremap <silent>˚ :m .-2<CR>
    inoremap <silent>∆ <Esc>:m .+1<CR>i
    inoremap <silent>˚ <Esc>:m .-2<CR>i
    vnoremap <silent>∆ :m '>+1<CR>gv
    vnoremap <silent>˚ :m '<-2<CR>gv
    snoremap <silent>∆ <c-v>v:m '>+1<CR>gv
    snoremap <silent>˚ <c-v>v:m '<-2<CR>gv

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

" alt + c v x 复制粘贴剪切
    " alt c 复制
        snoremap ç <c-v>vy
    " alt x 剪切
        snoremap ≈ <c-v>vd
    " alt v 粘贴
        snoremap √ <c-v>vPa
    " alt v 粘贴
        inoremap √ <esc>pa
    " alt v 粘贴
        nnoremap √ p
    " alt c 复制当前词
        nnoremap ç yiw

" select visual模式下 /  注释
" normal 模式下		  ?? 注释
" 实现原理: 光标所在行的第一位是/则代表	  当前已注释 则将 ^// 替换为空
"			光标所在行的第一位不是/则代表 当前为注释 则将 ^   替换为//
    snoremap <silent><expr>/ (getline('.')[0]=='/')?'<c-v>v:s/^\/\//<CR>:set nohlsearch<CR>':'<c-v>v:s/^/\/\//<CR>:set nohlsearch<CR>'
    vnoremap <silent><expr>/ (getline('.')[0]=='/')?'<c-v>v:s/^\/\//<CR>:set nohlsearch<CR>':'<c-v>v:s/^/\/\//<CR>:set nohlsearch<CR>'
    nnoremap <silent><expr>?? (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'

" 光标在{}上时折叠{}，否则切换折叠
" 实现原理: 光标所在位如果为{ 则折叠 {}，如果所在位为折叠，则展开
    nnoremap <silent><expr>-- foldclosed(line('.'))*((getline('.')[col('.')-1]=='{')+(getline('.')[col('.')-1]=='}'))<0?'zfa{':'za'

" VISUAL SELECT模式下 -折叠
	vnoremap <silent>- zf 
	snoremap <silent>- <c-v>zf

" 折叠非匹配内容
    nnoremap <silent>-/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

" 快速添加pairs
	snoremap ' <c-v>vdi''<esc>P
	snoremap " <c-v>vdi""<esc>P
	snoremap { <c-v>vdi{}<esc>P
	snoremap } <c-v>vdi{}<esc>P
	snoremap [ <c-v>vdi[]<esc>P
	snoremap ] <c-v>vdi[]<esc>P
	snoremap ( <c-v>vdi()<esc>P
	snoremap ) <c-v>vdi()<esc>P
	vnoremap ' di''<esc>P
	vnoremap " di""<esc>P
	vnoremap { di{}<esc>P
	vnoremap } di{}<esc>P
	vnoremap [ di[]<esc>P
	vnoremap ] di[]<esc>P
	vnoremap ( di()<esc>P
	vnoremap ) di()<esc>P
