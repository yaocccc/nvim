call plug#begin('~/.config/nvim/plugged')
	" 中文文档
		Plug 'yianwillis/vimcdoc'
	" 状态栏和主题
		Plug 'itchyny/lightline.vim'
		Plug 'mengelbrecht/lightline-bufferline'
		Plug 'junegunn/goyo.vim'
	" git
		Plug 'tpope/vim-fugitive'
		Plug 'airblade/vim-gitgutter'
	" 平滑翻页
		Plug 'terryma/vim-smooth-scroll'
	" marks
		Plug 'kshenoy/vim-signature'
	" 重复操作
		Plug 'tpope/vim-repeat'
	" 快速选择
		Plug 'terryma/vim-expand-region'
	" 快速跳转
		Plug 'lfv89/vim-interestingwords'
		Plug 'haya14busa/incsearch.vim'
		Plug 'haya14busa/incsearch-fuzzy.vim'
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
	" markdown
		Plug 'iamcco/mathjax-support-for-mkdp'
		Plug 'iamcco/markdown-preview.vim'
	" fzf
	" brew install the_silver_searcher
	" brew install fd
	" brew install fzf
		Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
		Plug 'junegunn/fzf.vim'
call plug#end()
