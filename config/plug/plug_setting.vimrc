" lightline & bufferline
	let g:lightline									= {}
	let g:lightline.colorscheme						= 'deus'
	let g:lightline.component_expand				= {'buffers': 'lightline#bufferline#buffers'}
	let g:lightline.component_type					= {'buffers': 'tabsel'}
	let g:lightline.active							= {'left': [['mode', 'gitbranch'], ['empty', 'buffers']], 'right': [['P', 'L', 'l'], ['filename']]}
	let g:lightline.component_function				= {'filename': 'LightlineFilename', 'gitbranch': 'FugitiveHead'}
	let g:lightline.component						= {'P': '%P', 'L': '%L', 'l': '%l', 'empty': '-->'}
	let g:lightline#bufferline#unnamed				= '[new]'
	let g:lightline#bufferline#filename_modifier	= ':t'
	let g:lightline.mode_map						= {'n': 'N', 'i': 'I', 'R': 'R', 'v': 'V', 'V': 'VL', '\<C-v>': 'VB', 'c': 'C', 's': 'S', 'S': 'SL', '\<C-s>': 'SB', 't': 'T'}
	function! LightlineFilename()
		let path = expand('%F')
		let filename = expand('%:t') !=# '' ? expand('%') : '[new]'
		let modified = &modified ? ' +' : ''
		return filename . modified
	endfunction

" vim-expand-region 快速选择
	" v扩大选择 V缩小选择
	vmap v <Plug>(expand_region_expand)
	vmap V <Plug>(expand_region_shrink)

" coc-vim
	" com-rename
		nmap <F2> <Plug>(coc-rename)
	" coc-snippets便携自定义补全文件
		" F9 :CocCommand snippets.editSnippets 编写自定义的代码片段
			nnoremap <silent><F9> :CocCommand snippets.editSnippets<CR>
	" 使用tab补全 c-j c-k 左右不同的修改 默认以tab键切换补全选项
		inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
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
	" 未指定文件时自动打开
		" autocmd StdinReadPre * let s:std_in=1
		" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	" 关闭所有文件时自动关闭
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	" 改变箭头样式 右箭头 下箭头
		let g:NERDTreeDirArrowExpandable = '+'
		let g:NERDTreeDirArrowCollapsible = '-'
		let g:NERDTreeIgnore = ['^node_modules$']
		let g:NERDTreeIndicatorMapCustom = {"Modified" : "✹", "Staged" : "✚", "Untracked" : "✭", "Renamed" : "➜", "Unmerged" : "═", "Deleted" : "✖", "Dirty" : "✹", "Clean" : "✔︎", 'Ignored' : '☒', "Unknown" : "?" }

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

" incsearch
	nmap /  <Plug>(incsearch-forward)
	nmap ?  <Plug>(incsearch-backward)
	nmap ss  <Plug>(incsearch-stay)
	nmap s/  <Plug>(incsearch-fuzzyspell-/)
	nmap s?  <Plug>(incsearch-fuzzyspell-?)

" markdown
	" F7开始浏览器预览 F8关闭
		nmap <silent> <F7> <Plug>MarkdownPreview
		imap <silent> <F7> <Plug>MarkdownPreview
		nmap <silent> <F8> <Plug>StopMarkdownPreview
		imap <silent> <F8> <Plug>StopMarkdownPreview

" fzf
	" maps
		command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
		nnoremap <silent> <c-a> :Ag<CR>
		nnoremap <silent> <c-p> :Files<CR>
		nnoremap <silent> <c-h> :History<CR>
		nnoremap <silent> <c-l> :Lines<CR>
		nnoremap <C-b> :Buffers<CR>

" 平滑翻页
	noremap <silent> <BS> :call smooth_scroll#up(&scroll*2, 0, 5)<CR>
	noremap <silent> <space> :call smooth_scroll#down(&scroll*2, 0, 5)<CR>

" 当前行字号加粗
    set cul
    hi CursorLine term = bold cterm = bold ctermfg = NONE ctermbg = NONE
    hi Normal ctermfg = 7
