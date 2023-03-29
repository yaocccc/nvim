local G = require('G')

G.cmd([[au BufEnter * if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]])

-- 光标回到上次位置
G.cmd([[ au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]])

-- 自动保存/加载view
G.cmd([[
    au FileType * try | silent! loadview | catch | endtry
    au BufLeave,BufWinLeave * silent! mkview
]])

G.cmd([[
    au InsertEnter * hi CursorLine ctermbg=235
    au InsertLeave * hi CursorLine ctermbg=none
]])

