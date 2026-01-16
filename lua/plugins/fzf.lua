local G = require('G')
local M = {}

function M.config()
    G.cmd([[
        func! CHistory()
          call filter(v:oldfiles, "v:val =~ '^' . $PWD . '/.*$'")
          lua require("fzf-lua").oldfiles()
        endf
        com! CHistory call CHistory()
    ]])
    local actions = require "fzf-lua.actions"
    local rg_opts = {
        '--color=always',
        '--column',
        '--line-number',
        '--no-heading',
        '--smart-case',
        '--glob "!vendor" --glob "!node_modules"',
        '--colors "path:fg:green"',
        '--colors "path:style:bold"',
        '--colors "match:fg:151"',
    }
    require 'fzf-lua'.setup {
        winopts       = {
            height     = 0.85,
            width      = 0.80,
            row        = 0.35,
            col        = 0.50,
            border     = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
            fullscreen = false,
            preview    = {
                border       = 'border', -- border|noborder, applies only to
                wrap         = 'nowrap', -- wrap|nowrap
                hidden       = 'nohidden', -- hidden|nohidden
                vertical     = 'down:45%', -- up|down:size
                horizontal   = 'right:40%', -- right|left:size
                layout       = 'flex', -- horizontal|vertical|flex
                flip_columns = 120, -- #cols to switch to horizontal on flex
                title        = true, -- preview border title (file/buf)?
                title_pos    = "left", -- left|center|right, title alignment
                scrollbar    = 'border', -- `false` or string:'float|border'
                scrolloff    = '-2', -- float scrollbar offset from right
                scrollchars  = { '█', '' }, -- scrollbar chars ({ <full>, <empty> }
                delay        = 100, -- delay(ms) displaying the preview
                winopts      = { -- builtin previewer window options
                    number         = true,
                    relativenumber = false,
                    cursorline     = true,
                    cursorlineopt  = 'both',
                    cursorcolumn   = false,
                    signcolumn     = 'no',
                    list           = false,
                    foldenable     = false,
                    foldmethod     = 'manual',
                },
            },
        },
        keymap        = {
            builtin = {
                ["<F1>"]     = "toggle-help",
                ["<F11>"]    = "toggle-fullscreen",
                ["<F4>"]     = "toggle-preview",
                ["<S-down>"] = "preview-page-down",
                ["<S-up>"]   = "preview-page-up",
                ["<S-left>"] = "preview-page-reset",
            },
            fzf = {
                -- fzf '--bind=' options
                ["ctrl-z"]     = "abort",
                ["ctrl-u"]     = "unix-line-discard",
                ["ctrl-f"]     = "half-page-down",
                ["ctrl-b"]     = "half-page-up",
                ["ctrl-a"]     = "beginning-of-line",
                ["ctrl-e"]     = "end-of-line",
                ["alt-a"]      = "toggle-all",
                ["f4"]         = "toggle-preview",
                ["shift-down"] = "preview-page-down",
                ["shift-up"]   = "preview-page-up",
            },
        },
        actions       = {
            files = {
                ["default"] = actions.file_edit_or_qf,
                ["ctrl-s"]  = actions.file_split,
                ["ctrl-v"]  = actions.file_vsplit,
                ["ctrl-t"]  = actions.file_tabedit,
                ["alt-q"]   = actions.file_sel_to_qf,
                ["alt-l"]   = actions.file_sel_to_ll,
            },
            buffers = {
                ["default"] = actions.buf_edit,
                ["ctrl-s"]  = actions.buf_split,
                ["ctrl-v"]  = actions.buf_vsplit,
                ["ctrl-t"]  = actions.buf_tabedit,
            }
        },
        fzf_opts      = {
            ["--ansi"]           = true,
            ["--info"]           = "inline-right", -- fzf < v0.42 = "inline"
            ["--height"]         = "100%",
            ["--layout"]         = "reverse",
            ["--border"]         = "none",
            ["--highlight-line"] = true, -- fzf >= v0.53
        },
        fzf_tmux_opts = { ["-p"] = "80%,80%", ["--margin"] = "0,0" },
        files = {
            prompt                 = 'Files❯ ',
            multiprocess           = true, -- run command in a separate process
            git_icons              = true, -- show git icons?
            file_icons             = true, -- show file icons?
            color_icons            = true, -- colorize file|git icons
            find_opts              = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
            rg_opts                = [[--color=never --files --hidden --follow -g "!.git"]],
            fd_opts                = [[--color=never --type f --hidden --follow --exclude .git]],
            cwd_prompt             = true,
            cwd_prompt_shorten_len = 32, -- shorten prompt beyond this length
            cwd_prompt_shorten_val = 1, -- shortened path parts length
            toggle_ignore_flag     = "--no-ignore", -- flag toggled in `actions.toggle_ignore`
            toggle_hidden_flag     = "--hidden", -- flag toggled in `actions.toggle_hidden`
        },
        grep = {
            prompt         = 'Rg❯ ',
            input_prompt   = 'Grep For❯ ',
            multiprocess   = true, -- run command in a separate process
            git_icons      = true, -- show git icons?
            file_icons     = true, -- show file icons?
            color_icons    = true, -- colorize file|git icons
            grep_opts      = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp -e",
            rg_opts        = table.concat(rg_opts, " "),
            rg_glob        = false, -- default to glob parsing?
            glob_flag      = "--iglob", -- for case sensitive globs use '--glob'
            glob_separator = "%s%-%-", -- query separator pattern (lua): ' --'
            actions        = {
                ["ctrl-g"] = { actions.grep_lgrep }
            },
            no_header      = true, -- hide grep|cwd header?
            no_header_i    = true, -- hide interactive header?
        },
        oldfiles = {
            prompt                  = 'History❯ ',
            cwd_only                = true,
            stat_file               = true,
            include_current_session = false,
        },
        buffers = {
            prompt        = 'Buffers❯ ',
            file_icons    = true, -- show file icons?
            color_icons   = true, -- colorize file|git icons
            sort_lastused = true, -- sort buffers() by last used
            show_unloaded = true, -- show unloaded buffers
            cwd_only      = false, -- buffers for the cwd only
            cwd           = nil, -- buffers list for a given dir
            actions       = {
                ["ctrl-x"] = { fn = actions.buf_del, reload = true },
            }
        },
    }
    G.map({
        { 'n', '<c-p>', ':lua require("fzf-lua").files({cwd = "$PWD"})<cr>', { silent = true, noremap = true } },
        { 'n', '<c-a>', ':lua require("fzf-lua").live_grep({cwd = "$PWD"})<cr>', { silent = true, noremap = true } },
        { 'n', '<c-b>', ':lua require("fzf-lua").buffers()<cr>', { silent = true, noremap = true } },
        { 'n', '<c-l>', ':lua require("fzf-lua").blines()<cr>', { silent = true, noremap = true } },
        { 'n', '<c-g>', ':lua require("fzf-lua").git_status({cwd = "$PWD"})<cr>', { silent = true, noremap = true } },
        { 'n', '<c-h>', ':CHistory<cr>', { silent = true, noremap = true } },
    })
end

return { "ibhagwan/fzf-lua", dependencies = { "kyazdani42/nvim-web-devicons" }, config = M.config }
