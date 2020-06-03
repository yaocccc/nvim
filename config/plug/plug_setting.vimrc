" vim-expand-region 快速选择
	" v扩大选择 V缩小选择
	vmap v <Plug>(expand_region_expand)
	vmap V <Plug>(expand_region_shrink)

" coc-vim
	" com-rename
		nmap <F2> <Plug>(coc-rename)
	" coc-snippets便携自定义补全文件
		" F9 :CocCommand snippets.editSnippets 编写自定义的代码片段
			nnoremap <F9> :CocCommand snippets.editSnippets<CR>
	" 使用tab补全 c-j c-k 左右不同的修改 默认以tab键切换补全选项
		inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
	" shift + tab 倒序选择
		inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
	" 退格时也检查补全
		function! s:check_back_space() abort
			let col = col('.') - 1
			return !col || getline('.')[col - 1] =~# '\s'
		endfunction
	" 空格刷新补全 回车选择补全
		inoremap <expr> <c-space> coc#refresh()
		inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	" Use `[g` and `]g` to navigate diagnostics
		nmap [g <Plug>(coc-diagnostic-prev)
		nmap ]g <Plug>(coc-diagnostic-next)
	" gd gy 跳转到定义
		nmap gd <Plug>(coc-definition)
		nmap gy <Plug>(coc-type-definition)
	" K 显示文档
		nnoremap K :call <SID>show_documentation()<CR>
		function! s:show_documentation()
			if (index(['vim','help'], &filetype) >= 0)
				execute 'h '.expand('<cword>')
			else
				call CocAction('doHover')
			endif
		endfunction
	" coc-translator 显示翻译
		nmap <Leader>m <Plug>(coc-translator-p)
		vmap <Leader>m <Plug>(coc-translator-pv)
		smap <Leader>m <c-g><Plug>(coc-translator-pv)

" NERDTree
	" tt打开
		nnoremap tt :NERDTreeToggle<CR>
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
		nnoremap gl :Gstatus<CR>

" git gitgutter
	" leader + g 切换git修改高亮
		nmap <c-g> :GitGutterLineHighlightsToggle<CR>

" js-beautify
	" v模式 s模式 = 美化选中行
		snoremap = <c-g>:!js-beautify<CR>
		vnoremap = :!js-beautify<CR>
	" n模式 == 美化当前行
		nnoremap == :.!js-beautify<CR>

" rainbow
	let g:rainbow_active = 1

" 快速跳转 vim-interestingwords
	" 设置不同匹配词颜色不同
		let g:interestingWordsRandomiseColors = 1
	" ff 匹配/取消 当前词  FF取消匹配所有
		nnoremap ff :call InterestingWords('n')<CR>
		nnoremap FF :call UncolorAllWords()<CR>
	" n跳转到下个 N跳转到上个
		nnoremap n :call WordNavigation('forward')<CR>
		nnoremap N :call WordNavigation('backward')<CR>

" markdown
	" F7开始浏览器预览 F8关闭
		nmap <F7> <Plug>MarkdownPreview
		imap <F7> <Plug>MarkdownPreview
		nmap <F8> <Plug>StopMarkdownPreview
		imap <F8> <Plug>StopMarkdownPreview

" fzf
	" maps
		command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)
		nnoremap <c-a> :Ag<CR>
		nnoremap <c-p> :Files<CR>
		nnoremap <c-h> :History<CR>
		nnoremap <c-l> :Lines<CR>
		nnoremap <C-b> :Buffers<CR>

" 平滑翻页
	nnoremap <BS> :call smooth_scroll#up(&scroll*2, 0, 3)<CR>
	nnoremap <space> :call smooth_scroll#down(&scroll*2, 0, 3)<CR>
