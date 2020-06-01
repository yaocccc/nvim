" 设置s t 无效 ;=: ,重复上一次宏操作
    map s <nop>
    map t <nop>
	map ; :
    nnoremap , @@

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
	inoremap <silent><s-up> <esc>vk
	inoremap <silent><s-down> <esc>vj
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

" alt kj 上下移动行
    nnoremap <silent>∆ :m .+1<CR>
    nnoremap <silent>˚ :m .-2<CR>
    inoremap <silent>∆ <Esc>:m .+1<CR>i
    inoremap <silent>˚ <Esc>:m .-2<CR>i
    vnoremap <silent>∆ :m '>+1<CR>gv
    vnoremap <silent>˚ :m '<-2<CR>gv
    snoremap <silent>∆ <c-g>:m '>+1<CR>gv
    snoremap <silent>˚ <c-g>:m '<-2<CR>gv

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
    snoremap <silent><expr>/ (getline('.')[0]=='/')?'<c-g>:s/^\/\//<CR>:set nohlsearch<CR>':'<c-g>:s/^/\/\//<CR>:set nohlsearch<CR>'
    vnoremap <silent><expr>/ (getline('.')[0]=='/')?':s/^\/\//<CR>:set nohlsearch<CR>':':s/^/\/\//<CR>:set nohlsearch<CR>'
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
