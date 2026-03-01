vim.bo.shiftwidth  = 2
vim.bo.tabstop     = 2
vim.bo.softtabstop = 2

-- 快速toggle todo状态
function G_markdown_toggleCheck(needsave)
    local line = vim.fn.getline('.')
    if line:match('^%s*- %[ %]') then line = line:gsub('%[ %]', '[x]')
    elseif line:match('^%s*- %[x%]') then line = line:gsub('%[x%]', '[ ]')
    else return end
    vim.fn.setline('.', line)
    if needsave == 1 then vim.cmd('w') end
end


vim.keymap.set('n', '<cr>', ':call v:lua.G_markdown_toggleCheck(0)<cr><cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('n', '<2-LeftMouse>', ':call v:lua.G_markdown_toggleCheck(1)<cr><2-LeftMouse>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', 'B', ':<c-u>call SurroundVaddPairs("**", "**")<cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', 'I', ':<c-u>call SurroundVaddPairs("*", "*")<cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', 'T', ':<c-u>call SurroundVaddPairs("- [ ] ", "")<cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', '`', ':<c-u>call SurroundVaddPairs("`", "``")<cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', 'C', ':<c-u>call SurroundVaddPairs("```plaintext", "```")<cr>', { noremap = true, silent = true, buffer = true })

-- 部分特殊的语法高亮
vim.api.nvim_set_hl(0, "MDTodoDate", { fg = "#5faf5f", italic = false })
vim.api.nvim_set_hl(0, "MDDoneDate", { fg = "#5faf5f", italic = true, strikethrough = true })
vim.api.nvim_set_hl(0, "MDTodoText", { italic = false })
vim.api.nvim_set_hl(0, "MDDoneText", { fg = "#00afaf", italic = true, strikethrough = true })
vim.api.nvim_set_hl(0, "MDDeadline", { fg = "#d70087", bold = true, underline = true })
vim.api.nvim_set_hl(0, "MDNearline", { fg = "#d7af00", bold = true })

-- 延迟加载，避免高亮冲突
vim.defer_fn(function() G_markdown_loadafter(vim.api.nvim_get_current_buf()) end, 0)
function G_markdown_loadafter(bufnr)
    vim.api.nvim_buf_call(bufnr, function()
        if not vim.api.nvim_buf_is_valid(bufnr) then return end
        vim.cmd([[syn match markdownError "\w\@<=\w\@="]])
        vim.cmd([[syn match MDDoneDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
        vim.cmd([[syn match MDTodoDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
        vim.cmd([[syn match MDDoneText /\zs.*- \[x\] \zs.*/ contains=MDDoneDate contained]])
        vim.cmd([[syn match MDTodoText /- \[ \] \zs.*/ contains=MDTodoDate contained]])
        vim.cmd([[syn match MDTask /\zs.*- \[\(x\| \)\] .*/ contains=MDDoneText,MDTodoText]])
        vim.cmd([[
        call matchadd('MDDeadline', 'D:'.strftime("%Y-%m-%d"))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 24))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 48))
    ]])
    end)
end
