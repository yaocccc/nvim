local G = require('G')
local M = {}

function M.init()
    vim.cmd([[
        func! CHistory()
          call filter(v:oldfiles, "v:val =~ '^' . $PWD . '/.*$'")
          lua require("fzf-lua").oldfiles()
        endf
        com! CHistory call CHistory()
    ]])
    G.map({
        { 'n', '<c-p>', ':lua require("fzf-lua").files({cwd = "$PWD"})<cr>',      { silent = true, noremap = true } },
        { 'n', '<c-a>', ':lua require("fzf-lua").live_grep({cwd = "$PWD"})<cr>',  { silent = true, noremap = true } },
        { 'n', '<c-b>', ':lua require("fzf-lua").buffers()<cr>',                  { silent = true, noremap = true } },
        { 'n', '<c-l>', ':lua require("fzf-lua").blines()<cr>',                   { silent = true, noremap = true } },
        { 'n', '<c-g>', ':lua require("fzf-lua").git_status({cwd = "$PWD"})<cr>', { silent = true, noremap = true } },
        { 'n', '<c-h>', ':CHistory<cr>',                                          { silent = true, noremap = true } },
    })
end

return { "ibhagwan/fzf-lua", dependencies = { "kyazdani42/nvim-web-devicons" }, init = M.init }
