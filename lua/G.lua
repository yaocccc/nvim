local G = {}

G.g = vim.g
G.b = vim.b
G.o = vim.o
G.v = vim.v
G.fn = vim.fn
G.api = vim.api
G.opt = vim.opt
G.treesitter = vim.treesitter

-- 批量设置快捷键
-- usage: G.map({
--     { {mode}, {lhs}, {rhs}, {opts} },
--     { {mode}, {lhs}, {rhs}, {opts} },
--     ...,
-- })
-- {mode} Mode short-name (map command prefix: "n", "i", "v", "x", …)
-- {lhs}  Left-hand-side |{lhs}| of the mapping.
-- {rhs}  Right-hand-side |{rhs}| of the mapping.
-- {opts} Optional parameters map: Accepts all |:map-arguments| as keys
function G.map(maps)
    for _,map in pairs(maps) do
        if map[4]["buffer"] then
            map[4]["buffer"] = nil
            G.api.nvim_buf_set_keymap(0, map[1], map[2], map[3], map[4])
        else
            G.api.nvim_set_keymap(map[1], map[2], map[3], map[4])
        end
    end
end

-- 批量设置高亮
-- usage: G.hi({
--     ["HIGROUP1"] = { fg = 71, bg = 3, italic = false, bold = true },
--     ["HIGROUP2"] = { fg = 71, italic = true, strikethrough = true },
--     ...,
-- })
function G.hi(hls)
    local colormode = G.o.termguicolors and '' or 'cterm'
    for group,color in pairs(hls) do
        local opt = color
        if color.fg then opt[colormode .. 'fg'] = color.fg end
        if color.bg then opt[colormode .. 'bg'] = color.bg end
        opt.bold = color.bold
        opt.underline = color.underline
        opt.italic = color.italic
        opt.strikethrough = color.strikethrough
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
