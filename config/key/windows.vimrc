" su 新左右窗口 SU新上下窗口 sc关闭当前 so关闭其他 s方向切换
    " 新左右分窗
        nnoremap su :vsp<CR>
    " 新上下分窗
        nnoremap SU :sp<CR>
    " 新上下分窗
        nnoremap Su :sp<CR>
    " 关闭当前window
        nnoremap sc :close<CR>
    " 仅保留当前window
        nnoremap so :only<CR>
    " 切换到左
        nnoremap s<Left> <c-w>h
    " 切换到右
        nnoremap s<Right> <c-w>l
    " 切换到上
        nnoremap s<Up> <c-w>k
    " 切换到下
        nnoremap s<Down> <c-w>j
    " 切换到左
        nnoremap sh <c-w>h
    " 切换到右
        nnoremap sl <c-w>l
    " 切换到上
        nnoremap sk <c-w>k
    " 切换到下
        nnoremap sj <c-w>j
    " 窗口大小一致
        nnoremap s= <c-w>=
    " 窗口大小左右变大
        nnoremap s. <c-w>10>
    " 窗口大小左右变小
        nnoremap s, <c-w>10<
    " 窗口大小上下变大
        nnoremap S> <c-w>10+
    " 窗口大小上下变小
        nnoremap S< <c-w>10-
" sv sh窗口横竖切换
    nnoremap sh <c-w>t<c-w>H
    nnoremap sv <c-w>t<c-w>K
