local G = require('G')
local ns = G.api.nvim_create_namespace('FoldSign')
function SetSign(line, sign, numberwidth)
    G.api.nvim_buf_set_extmark(0, ns, line, 0,
        { virt_text_win_col = -2 - numberwidth, virt_text = { { sign, 'FoldColumn' } } })
end

function FoldSign()
    local topline = G.fn.line('w0') - 1
    local botline = G.fn.line('w$')
    G.api.nvim_buf_clear_namespace(0, ns, topline, botline)
    local pre = 0
    local numberwidth = #tostring(G.fn.line('$'))
    if numberwidth < G.o.numberwidth then
        numberwidth = G.o.numberwidth
    end
    local i = topline
    while i <= botline do
        local foldlevel = G.fn.foldlevel(i)
        if foldlevel > 0 then
            local foldtext = foldlevel > 1 and '┃' or '│'
            local foldclosed = G.fn.foldclosed(i)
            local text = foldclosed > 0 and i == foldclosed and '+' or foldlevel > pre and '-' or foldtext
            SetSign(i - 1, text, numberwidth)
        end
        pre = foldlevel
        i = i + 1
    end
end

G.cmd('au VimEnter,WinEnter,BufWinEnter,ModeChanged,CursorMoved,CursorHold * call v:lua.FoldSign()')
