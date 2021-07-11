vim.g.floaterm_title = ''
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_autoclose = 1
vim.g.floaterm_opener = 'edit'
vim.api.nvim_command("au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif")
vim.api.nvim_command("hi! link FloatermBorder NONE")

function FTToggle(name, cmd, pre_cmd)
    if vim.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        vim.api.nvim_command(string.format('exec "FloatermToggle %s"', name))
    else
        vim.api.nvim_command(string.format('exec "%s"', pre_cmd))
        vim.api.nvim_command(string.format('FloatermNew --name=%s %s', name, cmd))
    end
end

require'common'.set_maps({
    { 'n', '<c-f>', ":call v:lua.FTToggle('FILE', 'ranger', '')<cr>", {silent = true, noremap = true}},
    { 'n', '<c-b>', ":call v:lua.FTToggle('DBUI', 'nvim +CALLDB', '')<cr>", {silent = true, noremap = true}},
    { 'n', '<c-t>', ":call v:lua.FTToggle('TERM', '', \"try \\| call system('~/scripts/edit-profile.sh VIM_TEM_DIR \" . $PWD . \"') \\| endtry\")<cr>", {silent = true, noremap = true}},
    { 't', '<c-f>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('FILE') == bufnr('%') ? '' : '<c-f>') : \"<c-f>\"", {silent = true, expr = true}},
    { 't', '<c-b>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('DBUI') == bufnr('%') ? '' : '<c-b>') : \"<c-b>\"", {silent = true, expr = true}},
    { 't', '<c-t>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('TERM') == bufnr('%') ? '' : '<c-t>') : \"<c-t>\"", {silent = true, expr = true}},
})
