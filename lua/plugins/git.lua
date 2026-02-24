local M = {}

function M.config()
    require('gitsigns').setup {
        signs                        = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged                 = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },
        signs_staged_enable          = true,
        signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
            follow_files = true
        },
        auto_attach                  = true,
        attach_to_untracked          = false,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil,   -- Use default
        max_file_length              = 40000, -- Disable if file is longer than this (in lines)
        preview_config               = {
            relative = 'cursor',
            border = 'rounded',
            row = 1,
            col = 0
        },
        on_attach                    = function(bufnr)
            local gitsigns = require('gitsigns')
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            map('n', '(', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '(', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end)

            map('n', ')', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ')', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end)

            map('n', 'C', gitsigns.preview_hunk)
            map('n', '\\g', gitsigns.diffthis)
        end
    }
end

return { "lewis6991/gitsigns.nvim", event = "CursorHold", config = M.config }
