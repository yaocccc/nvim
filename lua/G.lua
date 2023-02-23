local G = {}

G.g = vim.g
G.b = vim.b
G.o = vim.o
G.v = vim.v
G.fn = vim.fn
G.api = vim.api
G.opt = vim.opt

function G.map(maps)
    for _,map in pairs(maps) do
        G.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
    end
end

function G.hi(hls)
    local colormode = G.o.termguicolors and '' or 'cterm'
    for group,color in pairs(hls) do
        local opt = {}
        if color.fg then opt[colormode .. 'fg'] = color.fg end
        if color.bg then opt[colormode .. 'bg'] = color.bg end
        if color.italic then opt.italic = true end
        if color.bold then opt.bold = true end
        if color.underline then opt.underline = true end
        G.api.nvim_set_hl(0, group, opt)
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
