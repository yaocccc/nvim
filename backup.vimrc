" ====================================================
	" 空格作为leader
		let mapleader=" "

" ====================================================
" 插件
	" Plug插件
		call plug#begin('~/.vim/plugged')
			" 中文文档
				Plug 'yianwillis/vimcdoc'

			" 状态栏和主题
				Plug 'vim-airline/vim-airline'
				Plug 'vim-airline/vim-airline-themes'

			" git
				Plug 'tpope/vim-fugitive'

			" marks
				Plug 'kshenoy/vim-signature'

			" 快速选择
				Plug 'terryma/vim-expand-region'

			" 快速跳转
				Plug 'easymotion/vim-easymotion'
				Plug 'lfv89/vim-interestingwords'

			" nerdtree
				Plug 'preservim/nerdtree'
				Plug 'Xuyuanp/nerdtree-git-plugin'

			" 快速搜索文件c-p
				Plug 'kien/ctrlp.vim'
				Plug 'FelikZ/ctrlp-py-matcher'

			" 快速操作包围符号
				Plug 'tpope/vim-surround'

			" coc
			" CocInstall coc-html coc-snippets coc-css coc-tsserver coc-vetur coc-json coc-pairs coc-highlight coc-translator coc-markdownlint coc-tslint-plugin coc-word
				Plug 'neoclide/coc.nvim', {'branch': 'release'}

			" 括号高亮
				Plug 'luochen1990/rainbow'

			" 语法高亮
				Plug 'posva/vim-vue'
				Plug 'pangloss/vim-javascript'
				Plug 'leafgarland/typescript-vim'

			" markdown
				Plug 'iamcco/mathjax-support-for-mkdp'
				Plug 'iamcco/markdown-preview.vim'

		call plug#end()

" ====================================================
" 插件配置
	" airline
		let g:airline_powerline_fonts = 1					" 使用powerline字体
		let g:airline_theme='onedark'						" 设置主题
		let g:airline#extensions#tabline#enabled = 1		" 默认开启 buffer&tab line
		let g:airline#extensions#tabline#fnamemod = ':t'	" 格式化名称显示
		let g:airline_mode_map = {
					\ '__'     : '-',
					\ 'c'      : 'C',
					\ 'i'      : 'I',
					\ 'ic'     : 'I',
					\ 'ix'     : 'I',
					\ 'n'      : 'N',
					\ 'multi'  : 'M',
					\ 'ni'     : 'N',
					\ 'no'     : 'N',
					\ 'R'      : 'R',
					\ 'Rv'     : 'R',
					\ 's'      : 'S',
					\ 'S'      : 'S',
					\ 't'      : 'T',
					\ 'v'      : 'V',
					\ 'V'      : 'V-L'
					\ }										" 改写 mode 名称


	" easymotion
		" ss触发查找
			nmap <silent>ss <Plug>(easymotion-s2)


	" vim-javascript
		let g:javascript_plugin_flow = 1


	" vim-expand-region 快速选择
		" v扩大选择 V缩小选择
		vmap v <Plug>(expand_region_expand)
		vmap V <Plug>(expand_region_shrink)


	" coc-vim
		" coc-snippets便携自定义补全文件
			" F9 :CocCommand snippets.editSnippets 编写自定义的代码片段
				nnoremap <silent><F9> :CocCommand snippets.editSnippets<CR>

		" 使用tab补全 c-j c-k 左右不同的修改 默认以tab键切换补全选项
			inoremap <silent><expr> <TAB>
				\ pumvisible() ? "\<C-n>" :
				\ <SID>check_back_space() ? "\<TAB>" :
				\ coc#refresh()

		" shift + tab 倒序选择
			inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

		" 退格时也检查补全
			function! s:check_back_space() abort
				let col = col('.') - 1
				return !col || getline('.')[col - 1]  =~# '\s'
			endfunction

		" 空格取消补全 回车选择补全
			inoremap <silent><expr> <c-space> coc#refresh()
			inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

		" Use `[g` and `]g` to navigate diagnostics
			nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
			nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

		" gd gy 跳转到定义
			nmap <silent> gd <Plug>(coc-definition)
			nmap <silent> gy <Plug>(coc-type-definition)

		" K 显示文档
			nnoremap <silent> K :call <SID>show_documentation()<CR>
			function! s:show_documentation()
			  if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
			  else
				call CocAction('doHover')
			  endif
			endfunction

		" coc-translator 显示翻译
			nmap <silent><Leader>m <Plug>(coc-translator-p)
			vmap <silent><Leader>m <Plug>(coc-translator-pv)
			smap <silent><Leader>m <c-v>v<Plug>(coc-translator-pv)


	" NERDTree
		" tt打开
			nnoremap <silent>tt :NERDTreeToggle<CR>

		" 未指定文件时自动打开
			" autocmd StdinReadPre * let s:std_in=1
			" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

		" 关闭所有文件时自动关闭
			autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

		" 改变箭头样式 右箭头 下箭头
			let g:NERDTreeDirArrowExpandable = ''
			let g:NERDTreeDirArrowCollapsible = ''


	" ctrlp 设置忽略文件
		set wildignore+=*/tmp/*,*.so,*.swp,*.zip
		let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)|node_modules$'


	" git vim-fugitive
		" gl 打开 git status列表
			nnoremap <silent>gl :Gstatus<CR>


	" js-beautify
		" v模式 s模式 = 美化选中行
			snoremap <silent>= <c-v>v:!js-beautify<CR>
			vnoremap <silent>= :!js-beautify<CR>
		" n模式 == 美化当前行
			nnoremap <silent>== :.!js-beautify<CR>


	" rainbow
		let g:rainbow_active = 1


	" 快速跳转 vim-interestingwords
		" 设置不同匹配词颜色不同
			let g:interestingWordsRandomiseColors = 1
		" ff 匹配/取消 当前词   FF取消匹配所有
			nnoremap <silent> ff :call InterestingWords('n')<CR>
			nnoremap <silent> FF :call UncolorAllWords()<CR>
		" n跳转到下个 N跳转到上个
			nnoremap <silent> n :call WordNavigation('forward')<CR>
			nnoremap <silent> N :call WordNavigation('backward')<CR>


	" markdown
		" F7开始浏览器预览 F8关闭
			nnoremap <silent> <F7> <Plug>MarkdownPreview
			inoremap <silent> <F7> <Plug>MarkdownPreview
			nnoremap <silent> <F8> <Plug>StopMarkdownPreview
			inoremap <silent> <F8> <Plug>StopMarkdownPreview

" ====================================================
" 快捷键
	" 不退出执行cmd
		fun! Exec(cmd)
			exe a:cmd
			return ''
		endf

	" 设置s t 无效
		map s <nop>
		map t <nop>

	" S保存 Q退出 R重载vim配置 jj esc
		nnoremap S :w<CR>
		nnoremap Q :q!<CR>
		nnoremap R :source ~/.vimrc<CR>
		inoremap jj <Esc>

	" SELECT模式快捷键
		snoremap y <c-v>vygv
		snoremap d <c-v>vd
		snoremap c <c-v>vc
		snoremap x <c-v>vx
		snoremap p <c-v>vp

	" VISUAL SELECT模式 <>左右缩进
		vnoremap < <gv
		vnoremap > >gv
		snoremap < <c-v>v<gv
		snoremap > <c-v>v>gv

	" ,重复上一次宏操作
		nnoremap , @@

	" 快速跳转
		noremap <silent><leader>h 8h
		noremap <silent><leader>l 8l
		noremap <silent><leader>j :+15<CR>
		noremap <silent><leader>k :-16<CR>
		noremap <silent><leader><Left> 8h
		noremap <silent><leader><Right> 8l
		noremap <silent><leader><Down> :+15<CR>
		noremap <silent><leader><Up> :-16<CR>
		noremap <silent><leader><leader> <c-f>m

	" 0和tab 在 () 和 行首行尾切换
		nnoremap <expr><TAB> col('.') == 1 ? '$': '0'
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

	" 折叠非匹配内容
		nnoremap <silent>-/ :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>:set foldmethod=manual<CR><CR>

" ====================================================
" 显示相关
	" 开启256颜色 暗色背景
		set background=dark
		set term=xterm-256color
		let g:solarized_termcolors = 256
		let g:solarized_termtrans = 1
		colorscheme solarized8_high

	" 屏幕顶部底部总是保留5行
		set scrolloff=5

	" 设置插入模式时光标变成竖线
		let &t_SI.="\e[5 q" "SI = INSERT mode
		let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

	" 修改分隔符样式
		set fillchars=vert:/
		set fillchars=stl:/
		set fillchars=stlnc:/

	" 当前行字号加粗
		set cul
		hi CursorLine term=bold cterm=bold ctermfg=NONE ctermbg=NONE 
		hi Normal ctermfg=7

" ====================================================
" 基础配置
	" 设置命令提示 唯一标识 共享剪贴板
		set showcmd
		set encoding=utf-8
		let &t_ut=''
		set wildmenu
		set nocompatible
		set clipboard=unnamed

	" 搜索高亮 空格+回车 去除匹配高亮
		set hlsearch
		exec "nohlsearch"
		noremap <leader><CR> :nohlsearch<CR>
		set incsearch
		set ignorecase
		set smartcase

	" 设置正常删除
		set backspace=indent,eol,start

	" 设置鼠标移动
		set mouse=a
		set selection=exclusive
		set selectmode=mouse,key

	" 错误无提示音 去除屏幕闪烁
		set vb t_vb=""
		set hidden

	" 行号
		set nu

	" 显示
		set cmdheight=1
		set updatetime=300
		set shortmess+=c

	" 缩进对齐匹配等
		set autoindent
		set smartindent
		set showmatch
		set tabstop=4
		set softtabstop=4
		set laststatus=2
		set showtabline=2
		set shiftwidth=4

	" 折叠
		set foldenable
		set foldmethod=manual

	" 不自动备份
		set nobackup
		set noswapfile

	" 光标回到上次位置
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ====================================================
