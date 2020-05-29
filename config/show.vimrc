" 开启256颜色 暗色背景
    set background=dark
    " set term=xterm-256color
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
