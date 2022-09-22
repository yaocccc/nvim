local G = require('G')
local M = {}

function GitInfo()
    local branch = G.g.coc_git_status or ''
    local diff = G.b.coc_git_status or ''
    return (string.len(branch) > 0 and string.format(" %s ", branch) or " none ")
        .. (string.len(diff) > 0 and string.format('%s ', G.fn.trim(diff)) or '')
end
function CocErrCount()
    local coc_diagnostic_info = G.b.coc_diagnostic_info or { error = 0 }
    return string.format(' E%d ', coc_diagnostic_info.error)
end
function GetFt()
    local name = G.eval("expand('%:p')")
    local ft = G.eval('&ft')
    local icon = require('nvim-lines.common').get_fileicon(ft, name)
    return string.format(' %s ', string.len(ft) > 0 and icon .. ft or '~')
end

function M.config()
    G.g.powerline_symbols = { light_right = '', dark_right = '', light_left = '', dark_left = '' }
    G.g.line_powerline_enable = 1
    G.g.line_nerdfont_enable = 1
    G.g.line_unnamed_filename = '~'
    G.g.line_statusline_getters = {'v:lua.GitInfo', 'v:lua.CocErrCount', 'v:lua.GetFt'}
    G.g.line_hl = { none = 'NONE', light = 'NONE', dark = 'NONE', ['break'] = '244', space = 238 }
    G.cmd('au VimEnter * hi VimLine_Dark ctermfg=245')
    G.cmd('au VimEnter * hi VimLine_Buf_Dark ctermfg=245')
    G.cmd('au VimEnter * hi VimLine_Other ctermfg=245')
end

function M.setup()
    -- do nothing
end

return M
