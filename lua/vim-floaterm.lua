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
        vim.api.nvim_command(string.format('FloatermNew --autoclose=0 --name=%s %s', name, cmd))
    end
end

function SetFTToggleMap(key, name, cmd, pre_cmd)
    require'common'.set_maps({
        { 'n', key, string.format(":call v:lua.FTToggle('%s', '%s', '%s')<cr>", name, cmd, pre_cmd), {silent = true, noremap = true}},
        { 't', key, "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('" .. name .. "') == bufnr('%') ? '' : '" .. key.. "') : '" .. key.. "'", {silent = true, expr = true}},
    })
end

vim.api.nvim_exec(
[[
    func! SetVimDir()
        try
            call system('~/scripts/edit-profile.sh VIM_TEM_DIR ' . $PWD)
        endtry
    endf
]], false)


SetFTToggleMap('<c-b>', 'DBUI', 'nvim +CALLDB', '')
SetFTToggleMap('<c-t>', 'TERM', '', "call SetVimDir()")
SetFTToggleMap('<c-f>', 'FILE', 'ranger', '')
