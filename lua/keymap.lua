local function opts(msg, extra)
    if not extra then return { desc = msg, noremap = true, silent = true } end
    return vim.tbl_extend('force', { desc = msg, noremap = true, silent = true }, extra)
end

local function magic_save() -- 1 当目录不存在时 先创建目录, 2 当前文件是acwrite时, 用sudo保存
    if vim.fn.empty(vim.fn.glob(vim.fn.expand('%:p:h'))) then vim.fn.system('mkdir -p ' .. vim.fn.expand('%:p:h')) end
    if vim.o.buftype == 'acwrite' then
        vim.fn.execute('w !sudo tee > /dev/null %')
    else
        vim.fn.execute('w')
    end
end

local function magic_move() -- 光标在$ 0 ^依次跳转
    local first = 1
    local head = #vim.fn.getline('.') - #vim.fn.substitute(vim.fn.getline('.'), '^\\s*', '', 'G') + 1
    local before = vim.fn.col('.')
    vim.fn.execute(before == first and first ~= head and 'norm! ^' or 'norm! $')
    local after = vim.fn.col('.')
    if before == after then
        vim.fn.execute('norm! 0')
    end
end

local function magic_togglehump(upperCase) -- 驼峰转换
    vim.fn.execute('normal! gv"tx')
    local w = vim.fn.getreg('t')
    local toHump = w:find('_') ~= nil
    if toHump then
        w = w:gsub('_(%w)', function(c) return c:upper() end)
    else
        w = w:gsub('(%u)', function(c) return '_' .. c:lower() end)
    end
    if w:sub(1, 1) == '_' then w = w:sub(2) end
    if upperCase then w = w:sub(1,1):upper() .. w:sub(2) end
    vim.fn.setreg('t', w)
    vim.fn.execute('normal! "tP')
end

local magic_insertpair = function(char) -- 自动配对括号和引号
    local pair_close = { ['('] = ')', ['['] = ']', ['{'] = '}' }
    local close_set = { [')'] = true, [']'] = true, ['}'] = true, ['"'] = true, ["'"] = true, ['`'] = true }
    local quote_set = { ['"'] = true, ["'"] = true, ['`'] = true }
    local col = vim.fn.col('.')
    local after = vim.api.nvim_get_current_line():sub(col, col)
    local should_pair = after == '' or after == ';' or close_set[after]

    if pair_close[char] then
        if should_pair then return char .. pair_close[char] .. '<Left>' end
        return char
    end

    if after == char then return '<Right>' end
    if quote_set[char] and should_pair then return char .. char .. '<Left>' end
    return char
end

local function magic_delpair() -- 删除成对的括号和引号
    local line, col = vim.api.nvim_get_current_line(), vim.fn.col('.')
    if col > 1 and vim.tbl_contains({ ')', ']', '}', '"', "'", '`' }, line:sub(col, col))
        and vim.tbl_contains({ '(', '[', '{', '"', "'", '`' }, line:sub(col - 1, col - 1)) then
        return '<Del><BS>'
    end
    return '<BS>'
end

vim.keymap.set('n', 's', '<nop>', opts('禁用s键，避免误触'))
vim.keymap.set({ 'n', 'v' }, ';', ':', opts('将;键映射为:，方便输入命令', { silent = false }))
vim.keymap.set('n', ',', '@q', opts(',执行宏q'))
vim.keymap.set('n', '\\', ':nohlsearch<CR>', opts('按\\取消高亮搜索'))
vim.keymap.set('n', '+', '<c-a>', opts('+ = ctrl-a'))
vim.keymap.set('n', '_', '<c-x>', opts('- = ctrl-x'))
vim.keymap.set('n', '<bs>', '"_ciw', opts('快速删除'))
vim.keymap.set('i', '<c-h>', function() return vim.fn.col('.') == vim.fn.col('$') and '<esc>"_db"_xa' or '<esc>"_db"_xi' end, opts('快速删除', { expr = true }))

vim.keymap.set('n', '<c-j>', 'f,a<cr><esc>', opts('从,打断'))
vim.keymap.set('i', '<c-j>', '<esc>f,a<cr>', opts('从,打断'))

vim.keymap.set('c', '<c-a>', '<home>', opts('命令行模式 Ctrl-a 跳转到行首'))
vim.keymap.set('c', '<c-e>', '<end>', opts('命令行模式 Ctrl-e 跳转到行尾'))
vim.keymap.set('c', '<up>', '<c-p>', opts('命令行模式 Up 键历史命令'))
vim.keymap.set('c', '<down>', '<c-n>', opts('命令行模式 Down 键历史命令'))

vim.keymap.set('n', '<c-s>', ':<c-u>%s/\\v//gc<left><left><left><left>', opts('快捷替换'))
vim.keymap.set('v', '<c-s>', ':s/\\v//gc<left><left><left><left>', opts('快捷替换'))

vim.keymap.set('v', '<BS>', '"_d', opts('执行但不影响剪切板'))
vim.keymap.set('n', 'x', '"_x', opts('执行但不影响剪切板'))
vim.keymap.set('v', 'x', '"_x', opts('执行但不影响剪切板'))
vim.keymap.set('n', 'Y', 'y$', opts('执行但不影响剪切板'))
vim.keymap.set('v', 'c', '"_c', opts('执行但不影响剪切板'))
vim.keymap.set('v', 'p', 'pgvy', opts('执行但不影响剪切板'))
vim.keymap.set('v', 'P', 'Pgvy', opts('执行但不影响剪切板'))

vim.keymap.set('n', 'S', magic_save, opts('保存文件'))
vim.keymap.set('v', 'S', magic_save, opts('保存文件'))
vim.keymap.set('n', 'Q', ':q!<cr>', opts('强制退出'))
vim.keymap.set('n', 'R', ':e %<cr>', opts('重新加载当前文件'))

vim.keymap.set('v', '<', '<gv', opts('左缩进'))
vim.keymap.set('v', '>', '>gv', opts('右缩进'))
vim.keymap.set('v', '<s-tab>', '<gv', opts('左缩进'))
vim.keymap.set('v', '<tab>', '>gv', opts('右缩进'))
vim.keymap.set('n', '<m-up>', ':m .-2<cr>', opts('Alt-Up 向上移动当前行'))
vim.keymap.set('n', '<m-down>', ':m .+1<cr>', opts('Alt-Down 向下移动当前行'))
vim.keymap.set('i', '<m-up>', '<Esc>:m .-2<cr>i', opts('Alt-Up 向上移动当前行'))
vim.keymap.set('i', '<m-down>', '<Esc>:m .+1<cr>i', opts('Alt-Down 向下移动当前行'))
vim.keymap.set('v', '<m-up>', ":m '<-2<cr>gv", opts('Alt-Up 向上移动选中行'))
vim.keymap.set('v', '<m-down>', ":m '>+1<cr>gv", opts('Alt-Down 向下移动选中行'))

vim.keymap.set('v', '<s-right>', 'e', opts('shift + 右 词尾'))
vim.keymap.set('i', '<s-right>', '<esc>ea', opts('shift + 右 词尾'))
vim.keymap.set('n', '<s-left>', '<left>vh', opts('shift + 左 词首'))
vim.keymap.set('n', '<s-right>', 'vl', opts('shift + 右 词尾'))
vim.keymap.set('i', '<s-up>', '<esc>vkl', opts('shift + 上 选择文本'))
vim.keymap.set('i', '<s-down>', '<esc>lvjh', opts('shift + 下 选择文本'))
vim.keymap.set('n', '<s-up>', 'Vk', opts('shift + 上 选择文本'))
vim.keymap.set('n', '<s-down>', 'Vj', opts('shift + 下 选择文本'))
vim.keymap.set('v', '<s-up>', 'k', opts('shift + 上 选择文本'))
vim.keymap.set('v', '<s-down>', 'j', opts('shift + 下 选择文本'))

vim.keymap.set({ 'n', 'v' }, '<c-s-up>', '10<up>', opts('Ctrl-Shift-Up 快速向上'))
vim.keymap.set({ 'n', 'v' }, '<c-s-down>',  '10<down>', opts('Ctrl-Shift-Down 快速向下'))
vim.keymap.set({ 'i' }, '<c-s-up>', '<up><up><up><up><up><up><up><up><up><up>', opts('Ctrl-Shift-Up 快速向上'))
vim.keymap.set({ 'i' }, '<c-s-down>',  '<down><down><down><down><down><down><down><down><down><down>', opts('Ctrl-Shift-Down 快速向下'))
vim.keymap.set({ 'n', 'i', 'v' }, '<c-s-left>',  '<home>', opts('Ctrl-Shift-Left 句首'))
vim.keymap.set({ 'n', 'i' }, '<c-s-right>', '<end>', opts('Ctrl-Shift-Right 句尾'))
vim.keymap.set('v', '<c-s-right>', '<end>h', opts('Ctrl-Shift-Right 句尾')) -- visual模式下，避免选中行尾的换行符

vim.keymap.set('n', '<m-a>', 'ggVG', opts('选中全文'))
vim.keymap.set('n', '<c-u>', 'cc<Esc>', opts('Ctrl-u 清空一行'))
vim.keymap.set('i', '<c-u>', '<Esc>cc', opts('Ctrl-u 清空一行'))

-- windows & buffers
vim.keymap.set('n', 'sv', ':vsp<cr><c-w>w', opts('左右分屏'))
vim.keymap.set('n', 'sp', ':sp<cr><c-w>w', opts('上下分屏'))
vim.keymap.set('n', 'sc', ':close<cr>', opts('关闭当前窗口'))
vim.keymap.set('n', 'so', ':only<cr>', opts('关闭其他窗口'))
vim.keymap.set('n', 's<Left>', '<c-w>h', opts('切换到左边窗口'))
vim.keymap.set('n', 's<Right>', '<c-w>l', opts('切换到右边窗口'))
vim.keymap.set('n', 's<Up>', '<c-w>k', opts('切换到上边窗口'))
vim.keymap.set('n', 's<Down>', '<c-w>j', opts('切换到下边窗口'))
vim.keymap.set('n', '<c-Space>', '<c-w>w', opts('切换窗口'))
vim.keymap.set('n', 's=', '<c-w>=', opts('平均分配窗口'))
vim.keymap.set('n', '<m-.>', function() return vim.fn.winnr() <= vim.fn.winnr('$') - vim.fn.winnr() and '<c-w>10>' or '<c-w>10<' end, opts('增大当前窗口', { expr = true }))
vim.keymap.set('n', '<m-,>', function() return vim.fn.winnr() <= vim.fn.winnr('$') - vim.fn.winnr() and '<c-w>10<' or '<c-w>10>' end, opts('缩小当前窗口', { expr = true }))
vim.keymap.set('n', 'W', ':bw<cr>', opts('关闭当前buffer'))
vim.keymap.set('n', 'ss', ':bn<cr>', opts('切换到下一个buffer'))
vim.keymap.set('n', '<m-left>', ':bp<cr>', opts('切换到上一个buffer'))
vim.keymap.set('n', '<m-right>', ':bn<cr>', opts('切换到下一个buffer'))
vim.keymap.set({ 'v', 'i' }, '<m-left>', '<esc>:bp<cr>', opts('切换到上一个buffer'))
vim.keymap.set({ 'v', 'i' }, '<m-right>', '<esc>:bn<cr>', opts('切换到下一个buffer'))

vim.keymap.set('n', 'tt', ':below 10sp | term<cr>a', opts('打开一个10行大小的终端'))
vim.keymap.set('n', '\\w', function() return vim.o.wrap and ':set nowrap<cr>' or ':set wrap<cr>' end, opts('切换是否wrap', { expr = true }))

vim.keymap.set('n', '-', function() return vim.fn.foldlevel('.') > 0 and 'za' or 'va{zf^' end, opts('折叠/展开', { expr = true }))
vim.keymap.set('v', '-', 'zf', opts('折叠选中行'))

vim.keymap.set('n', '<space>', magic_move, opts('space 行首行尾跳转'))
vim.keymap.set('n', '0', '%', opts('pair跳转'))
vim.keymap.set('v', '0', '%', opts('pair跳转'))

vim.keymap.set('v', 'T', function() magic_togglehump(true) end, opts('驼峰转换（首字母大写）'))
vim.keymap.set('v', 't', function() magic_togglehump(false) end, opts('驼峰转换（首字母小写）'))

for _, c in ipairs({ '(', '[', '{', ')', ']', '}', '"', "'", '`' }) do
    vim.keymap.set('i', c, function() return magic_insertpair(c) end, { expr = true, noremap = true })
end
vim.keymap.set('i', '<BS>', magic_delpair, { expr = true, noremap = true })

-- 对外提供，供命令行直接调用设置bar不显示
function G_toggleBar(status)
    vim.cmd('set laststatus=' .. status)
    vim.cmd('set showtabline=' .. status)
    if status == 0 then
        vim.o.winbar = ' '
    end
end
