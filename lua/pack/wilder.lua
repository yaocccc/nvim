local G = require('G')
local M = {}

function M.config()
    -- do nothing
end

function M.setup()
    local wilder = require('wilder')
    wilder.setup({
        modes = { ':', '/', '?' },
        next_key = 0, previous_key = 0, reject_key = 0, accept_key = 0
    })
    wilder.set_option('pipeline', {
        wilder.branch(
            {
                wilder.check(function (_, x) return G.fn.empty(x) end),
                wilder.history(15)
            },
            wilder.cmdline_pipeline({
                fuzzy = 1,
                fuzzy_filter = wilder.vim_fuzzy_filter()
            }),
            wilder.search_pipeline()
        ),
    })
    wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlights = {
                accent = "WilderAccent",
                selected_accent = "WilderSelectedAccent",
            },
            highlighter = wilder.basic_highlighter(),
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
            border = 'rounded',
            max_height = 12 -- 最大高度限制 因为要计算上下 所以12支持最多10个选项
        })
    ))
    G.cmd("silent! UpdateRemotePlugins")
    G.hi({
        WilderAccent = { fg = 12 },
        WilderSelectedAccent = { fg = 12, bg = 239 },
    })
    G.map({
        { 'c', '<tab>', [[wilder#in_context() ? wilder#next() : '<tab>']], { noremap = true, expr = true } },
        { 'c', '<Down>', [[wilder#in_context() ? wilder#next() : '<down>']], { noremap = true, expr = true } },
        { 'c', '<up>', [[wilder#in_context() ? wilder#previous() : '<up>']], { noremap = true, expr = true } },
        { 'c', '0', '0', {}}, -- 不清楚原因导致0无法使用 强制覆盖
    })
end

return M
