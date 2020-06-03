" 设置s t 无效 ;=: ,重复上一次宏操作
    map s <nop>
    map t <nop>
	map ; :
    nnoremap , @@
	nnoremap + <c-a>

" x 只删除 不复制
	nnoremap x "_x

" S保存 Q退出 R重载vim配置 jj=esc
    nnoremap S :w<CR>
    nnoremap Q :q!<CR>
    nnoremap R :source ~/.config/nvim/init.vim<CR>
    inoremap jj <Esc>

" SELECT模式快捷键
    snoremap y <c-g>y
    snoremap d <c-g>d
    snoremap c <c-g>c
    snoremap x <c-g>x
    snoremap p <c-g>"_dP
    vnoremap p "_dP

" VISUAL SELECT模式 s-tab tab左右缩进"
    vnoremap < <gv
    vnoremap > >gv
    snoremap < <c-g><gv
	snoremap > <c-g>>gv"

    vnoremap <s-tab> <gv
	vnoremap <tab> >gv
    snoremap <s-tab> <c-g><gv
	snoremap <tab> <c-g>>gv

" SHIFT + 方向 选择文本
	inoremap <s-up> <esc>vk
	inoremap <s-down> <esc>vj
	nnoremap <s-left> vh
	nnoremap <s-right> vl
	nnoremap <s-up> Vk
	nnoremap <s-down> Vj
	vnoremap <s-up> k
	vnoremap <s-down> j
	snoremap <s-up> <esc>Vk
	snoremap <s-down> <esc>Vj

" 快速跳转
    noremap <leader>h 8h
    noremap <leader>l 8l
    noremap <leader>j :+15<CR>
    noremap <leader>k :-16<CR>
    noremap <leader><Left> 8h
    noremap <leader><Right> 8l
    noremap <leader><Down> :+15<CR>
    noremap <leader><Up> :-16<CR>

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
    vnoremap ∆ :m '>+1<CR>gv
    vnoremap ˚ :m '<-2<CR>gv
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


" select visual模式下 /  注释
" normal 模式下		  ?? 注释
" 实现原理: 光标所在行的第一位是/则代表	  当前已注释 则将 ^// 替换为空
"			光标所在行的第一位不是/则代表 当前为注释 则将 ^   替换为//
    snoremap <expr>/ (getline('.')[0]=='/')?'<c-g>:s/^\/\//<CR>:set nohlsearch<CR>':'<c-g>:s/^/\/\//<CR>:set nohlsearch<CR>'
    vnoremap <expr>/ (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'
    nnoremap <expr>?? (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'

" 光标在{}上时折叠{}，否则切换折叠
" 实现原理: 光标所在位如果为{ 则折叠 {}，如果所在位为折叠，则展开
    nnoremap <expr>-- foldclosed(line('.'))*((getline('.')[col('.')-1]=='{')+(getline('.')[col('.')-1]=='}'))<0?'zfa{':'za'

" VISUAL SELECT模式下 -折叠
	vnoremap - zf 
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
	vnoremap ' di''<esc>P
	vnoremap " di""<esc>P
	vnoremap { di{}<esc>P
	vnoremap } di{}<esc>P
	vnoremap [ di[]<esc>P
	vnoremap ] di[]<esc>P
	vnoremap ( di()<esc>P
	vnoremap ) di()<esc>P

" F5 一键运行js ts代码
	nmap <F5> :w<cr>:w !ts-node %<cr>
