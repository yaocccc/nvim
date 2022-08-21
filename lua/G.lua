local G = {}

G.g = vim.g
G.b = vim.b
G.fn = vim.fn
G.api = vim.api

function G.map(maps)
    for _,map in pairs(maps) do
        G.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

function G.hi(hls)
    for group,color in pairs(hls) do
        local fg = color.fg and ' ctermfg=' .. color.fg or ' ctermfg=NONE'
        local bg = color.bg and ' ctermbg=' .. color.bg or ' ctermbg=NONE'
        local sp = color.sp and ' cterm=' .. color.sp or ''
        G.api.nvim_command('highlight ' .. group .. fg .. bg .. sp)
        G.api.nvim_command('highlight ' .. 'TS' .. group .. fg .. bg .. sp)
    end
end

function G.cmd(cmd)
    G.api.nvim_command(cmd)
end

function G.exec(c)
    G.api.nvim_exec(c)
end

function G.eval(c)
    return G.api.nvim_eval(c)
end

return G
