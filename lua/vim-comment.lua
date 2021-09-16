-- vim-comment
vim.g.vim_line_comments = { vim = '"', vimrc = '"', js = '//', ts = '//', java = '//', class = '//', c = '//', h = '//', go = '//', lua = '--', proto = '//', ['go.mod'] = '//', md = '[^_^]:' }
vim.g.vim_chunk_comments = { js = {'/**', ' *', ' */'}, ts = {'/**', ' *', ' */'}, sh = {':<<!', '', '!'}, proto = {'/**', ' *', ' */'}, md = {'[^_^]:', '    ', ''} }
require'common'.set_maps({
    { 'n', '??', ':NToggleComment<cr>', {silent = true, noremap = true}},
    { 'v', '/', ':<c-u>VToggleComment<cr>', {silent = true, noremap = true}},
    { 'v', '?', ':<c-u>CToggleComment<cr>', {silent = true, noremap = true}},
})
