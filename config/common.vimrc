" common
    " 空格作为leader
        let mapleader="z"
    " 不退出执行cmd
        fun! Exec(cmd)
            exe a:cmd
            return ''
        endf

" setting
    " python3支持
        let g:python3_host_prog = '/usr/local/bin/python3'
    " 设置命令提示 唯一标识 共享剪贴板
        set showcmd
        set encoding=utf-8
        let &t_ut=''
        set wildmenu
        set nocompatible
        set clipboard=unnamed
    " 搜索高亮 空格+回车 去除匹配高亮
        set hlsearch
        set showmatch
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
    " 不换行
    "    set nowrap
    " 缩进对齐
        set autoindent
        set smartindent
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set smarttab
        set expandtab
    " 不自动备份
        set nobackup
        set noswapfile
    " 光标回到上次位置
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    " 持久化撤销
        set undofile
        set undodir=~/.config/nvim/file_logs
    " 折叠
        set foldenable
        set foldmethod=manual

" show
    " 开启256颜色 暗色背景
        set background=dark
        let g:solarized_termcolors = 256
        let g:solarized_termtrans = 1
        colorscheme solarized8_high
    " 命令行高度始终为1 屏幕刷新间隔300
        set cmdheight=1
        set updatetime=300
        set shortmess+=c
    " 屏幕顶部底部总是保留5行
        set scrolloff=5
    " 不显示模式
        set noshowmode
    " 行号 行高亮 始终显示标记列
        set nu
        set cul
        set signcolumn=yes
    " 设置插入模式时光标变成竖线
        let &t_SI.="\e[5 q" "SI = INSERT mode
        let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
    " 修改分隔符样式
        set fillchars=vert:/
        set fillchars=stl:/
        set fillchars=stlnc:/
    " statusline & tabline
        set laststatus=2
        set showtabline=2
