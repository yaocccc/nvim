function GitInfo()
    local branch = vim.g.coc_git_status or ''
    local diff = vim.b.coc_git_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ")
        .. (string.len(diff) > 0 and string.format('%s ', vim.fn.trim(diff)) or '')
end
function CocErrCount()
    local coc_diagnostic_info = vim.b.coc_diagnostic_info or { error = 0 }
    return string.format(' E%d ', coc_diagnostic_info.error)
end
function GetFt()
    local ft = vim.api.nvim_eval('&ft')
    return string.format(' %s ', string.len(ft) > 0 and ft or '~')
end

vim.g.line_powerline_enable = 0
vim.g.line_nerdfont_enable = 1
vim.g.line_unnamed_filename='~'
vim.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
vim.g.line_hl = { none = 'NONE', light = 'NONE', dark = 'NONE', ['break'] = '244' }
vim.api.nvim_command('au VimEnter * hi VimLine_Light cterm=BOLD')
vim.api.nvim_command('au VimEnter * hi CursorLine ctermbg=NONE')
vim.api.nvim_command('au VimEnter * hi CursorLineNr ctermbg=NONE')
