" 开启256颜色 暗色背景
    " set term=xterm-256color
    set background=dark
    let g:solarized_termcolors = 256
    let g:solarized_termtrans = 1
    colorscheme solarized8_high

" 屏幕顶部底部总是保留5行
    set scrolloff=5

" 不显示模式
	set noshowmode

" 所在行高亮
    set cul

" 设置插入模式时光标变成竖线
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" 修改分隔符样式
    set fillchars=vert:/
    set fillchars=stl:/
    set fillchars=stlnc:/
