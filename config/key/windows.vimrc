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