local G = require('G')
local M = {
    wilder_started = 0,
}

function M.config()
    -- do nothing
end

function M.setup()
    local wilder = require('wilder')
    wilder.setup({
        modes = { ':', '/', '?' },
        next_key = 0,
        previous_key = 0,
        reject_key = 0,
        accept_key = 0,
    })
    wilder.set_option('pipeline', {
        wilder.branch(
            wilder.cmdline_pipeline(),
            wilder.search_pipeline()
        ),
        wilder.debounce(10)
    })
    wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
            highlights = {
                accent = wilder.make_hl(
                    'WilderPoppupMenuAccent',
                    'Pmenu',
                    {
                        {}, {12}, {foreground = '#f4468f'},
                    }
                ),
            },
            highlighter = wilder.basic_highlighter(),
            left = { ' ', wilder.popupmenu_devicons() },
            right = { ' ', wilder.popupmenu_scrollbar() },
            border = 'rounded',
        })
    ))
    G.map({
        { 'c', '<tab>', [[wilder#in_context() ? wilder#next() : '<tab>']], { noremap = true, expr = true } },
        { 'c', '<Down>', [[wilder#in_context() ? wilder#next() : '<down>']], { noremap = true, expr = true } },
        { 'c', '<up>', [[wilder#in_context() ? wilder#previous() : '<up>']], { noremap = true, expr = true } },
    })
end

return M
