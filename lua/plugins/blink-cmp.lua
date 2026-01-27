local M = {}

function M.init()
    vim.cmd("hi BlinkCmpLabelMatch guifg=#00afaf")
end

return {
    'saghen/blink.cmp',
    version = '1.*',
    init = M.init,
    opts = {
        keymap = {
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Enter>'] = { 'select_and_accept', 'fallback' },
        },
        appearance = { nerd_font_variant = 'mono' },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = 'rounded', },
            },
            menu = { border = 'rounded', }
        },
        cmdline = { enabled = false },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
    enabled = false,
}
