local G = require('G')
local M = {}

function M.config()
    G.g.fzf_preview_window = {'right,40%,<50(down,50%)', 'ctrl-/'}
    G.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    G.g.fzf_layout = {
        window={
            width=0.9,
            height=0.8
        }
    }
    G.cmd([[
        func! RipgrepFzf(query, fullscreen)
          let command_fmt = 'rg --color=always --column --line-number --no-heading --smart-case'
          let command_fmt .= ' --glob "!vendor" --glob "!node_modules"'
          let command_fmt .= ' --colors "path:fg:green" --colors "path:style:bold"'
          let command_fmt .= ' --colors "match:fg:151"'
          let command_fmt .= ' -- %s || true'
          let initial_command = printf(command_fmt, shellescape(a:query))
          let reload_command = printf(command_fmt, '{q}')
          let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
          let spec = fzf#vim#with_preview(spec, 'right,40%,<50(down,50%)', 'ctrl-/')
          call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
        endf

        com! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
    ]])
    G.cmd([[
        func! CHistory()
          call filter(v:oldfiles, "v:val =~ '^' . $PWD . '.*$'")
          call fzf#vim#history(fzf#vim#with_preview(), 0)
        endf

        com! CHistory call CHistory()
    ]])
    G.map({
        { 'n', '<c-a>', ':RG<cr>',       { silent = true, noremap = true } },
        { 'n', '<c-p>', ':Files<cr>',    { silent = true, noremap = true } },
        { 'n', '<c-l>', ':BLines<cr>',   { silent = true, noremap = true } },
        { 'n', '<c-g>', ':GFiles?<cr>',  { silent = true, noremap = true } },
        { 'n', '<c-h>', ':CHistory<cr>', { silent = true, noremap = true } },
    })
end

function M.setup()
    -- do nothing
end

return M
