" python3支持
	let g:python3_host_prog = '/usr/bin/python3'

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

" 设置正常删除 光标穿越行
    set backspace=indent,eol,start
	set whichwrap+=<,>,h,

" 设置鼠标移动
    set mouse=a
    set selection=exclusive
    set selectmode=mouse,key

" 错误无提示音 去除屏幕闪烁
    set vb
    set t_vb=""
    set hidden

" 行号
    set nu
	set signcolumn=yes

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
    set showtabline=1
    set shiftwidth=4

" 折叠
    set foldenable
    set foldmethod=manual

" 不自动备份
    set nobackup
    set noswapfile

" 光标回到上次位置
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 当关闭文件并再次进入时，可以使用 u 进行撤销动作
	set undofile
	set undodir=~/.config/nvim/file_logs
