" 插件
	" Plug插件
		call plug#begin('~/.vim/plugged')
			" 中文文档
				Plug 'yianwillis/vimcdoc'
			" 状态栏和主题
				Plug 'vim-airline/vim-airline'
				Plug 'vim-airline/vim-airline-themes'
			" 平滑翻页
				Plug 'terryma/vim-smooth-scroll'
			" git
				Plug 'tpope/vim-fugitive'
			" marks
				Plug 'kshenoy/vim-signature'
			" 快速选择
				Plug 'terryma/vim-expand-region'
			" 快速跳转
				Plug 'lfv89/vim-interestingwords'
			" nerdtree
				Plug 'scrooloose/nerdtree'
				Plug 'Xuyuanp/nerdtree-git-plugin'
			" 快速操作包围符号
				Plug 'tpope/vim-surround'
			" coc
			" CocInstall coc-html coc-snippets coc-css coc-tsserver coc-vetur coc-json coc-pairs coc-translator coc-markdownlint coc-word
				Plug 'neoclide/coc.nvim', {'branch': 'release'}
			" 括号高亮
				Plug 'luochen1990/rainbow'
			" 语法高亮
				Plug 'posva/vim-vue'
				Plug 'pangloss/vim-javascript'
				Plug 'HerringtonDarkholme/yats.vim'
			" markdown
				Plug 'iamcco/mathjax-support-for-mkdp'
				Plug 'iamcco/markdown-preview.vim'
			" fzf
			" brew install the_silver_searcher
			" brew install fzf
				Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
				Plug 'junegunn/fzf.vim'
		call plug#end()


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

	" vim-javascript
		let g:javascript_plugin_flow = 1

	" vim-expand-region 快速选择
		" v扩大选择 V缩小选择
		vmap v <Plug>(expand_region_expand)
		vmap V <Plug>(expand_region_shrink)
	
	" 平滑翻页
		noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
		noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>
		noremap <silent> <leader><leader> :call smooth_scroll#down(&scroll*2, 0, 2)<CR>
		noremap <silent> <BS><BS> :call smooth_scroll#up(&scroll*2, 0, 2)<CR>
			
	" coc-vim
		" com-rename
			nmap <F2> <Plug>(coc-rename)
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
		" 空格刷新补全 回车选择补全
			inoremap <silent><expr> <c-space> coc#refresh()
			inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
		" Use `[g` and `]g` to navigate diagnostics
			nmap <silent> [g <Plug>(coc-diagnostic-prev)
			nmap <silent> ]g <Plug>(coc-diagnostic-next)
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
		" 关闭所有文件时自动关闭
			autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
		" 改变箭头样式 右箭头 下箭头
			let g:NERDTreeDirArrowExpandable = '+'
			let g:NERDTreeDirArrowCollapsible = '-'
			let g:NERDTreeIgnore = ['^node_modules$']
			let g:NERDTreeIndicatorMapCustom = {
				\ "Modified"  : "✹",
				\ "Staged"    : "✚",
				\ "Untracked" : "✭",
				\ "Renamed"   : "➜",
				\ "Unmerged"  : "═",
				\ "Deleted"   : "✖",
				\ "Dirty"     : "✹",
				\ "Clean"     : "✔︎",
				\ 'Ignored'   : '☒',
				\ "Unknown"   : "?"
				\ }
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
			nmap <silent> <F7> <Plug>MarkdownPreview
			imap <silent> <F7> <Plug>MarkdownPreview
			nmap <silent> <F8> <Plug>StopMarkdownPreview
			imap <silent> <F8> <Plug>StopMarkdownPreview
	
	" fzf
		" maps
			command! -bang -nargs=* Ag
			  \ call fzf#vim#ag(<q-args>,
			  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
			  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
			  \                 <bang>0)
			" 全局文本搜索
				nnoremap <silent> <c-a> :Ag<CR>
			" 项目文件搜索
				nnoremap <silent> <c-p> :Files<CR>
			" 历史文件
				nnoremap <silent> <c-h> :History<CR>
			" 文件内line搜索
				nnoremap <silent> <c-l> :Lines<CR>
		" 未指定文件时自动打开
			" autocmd StdinReadPre * let s:std_in=1
			" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | History | endif
