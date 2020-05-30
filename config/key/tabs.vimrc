" tu新建标签页 tn tp切换标签 tc关闭 to关闭其他 t数字跳到对应tab
    " 切换tab
        nnoremap <silent>T gt<CR>
    " 创建tab
        nnoremap <silent>tu :tabe<CR>
    " 跳转到下个tab
        nnoremap <silent>tn :+tabnext<CR>
    " 跳转到上个tab
        nnoremap <silent>tp :-tabnext<CR>
    " 关闭当前tab
        nnoremap <silent>tc :tabc<CR>
    " 仅保留当前tab
        nnoremap <silent>to :tabo<CR>
    " 跳转到第1个tab
        nnoremap <silent>t1 1gt
    " 跳转到第2个tab
        nnoremap <silent>t2 2gt
    " 跳转到第3个tab
        nnoremap <silent>t3 3gt
    " 跳转到第4个tab
        nnoremap <silent>t4 4gt
    " 跳转到第5个tab
        nnoremap <silent>t5 5gt
    " 跳转到第6个tab
        nnoremap <silent>t6 6gt
    " 跳转到第7个tab
        nnoremap <silent>t7 7gt
    " 跳转到第8个tab
        nnoremap <silent>t8 8gt
    " 跳转到第9个tab
        nnoremap <silent>t9 9gt
    " 跳转到最后一个tab
        nnoremap <silent>t0 :tablast<CR>