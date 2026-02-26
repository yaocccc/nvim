local M = {}

function M.intall(lang)
    local treesitter = require('nvim-treesitter')
    if vim.list_contains(treesitter.get_available(), lang) then
        if not vim.list_contains(treesitter.get_installed(), lang) then
            treesitter.install { lang }
        end
    end
end

function M.start()
    local treesitter = require('nvim-treesitter')
    local filetype = vim.api.nvim_eval('&ft')
    local lang = vim.treesitter.language.get_lang(filetype)
    if vim.list_contains(treesitter.get_installed(), lang) then
        vim.treesitter.start()
    end
end

function M.parser_bootstrap()
    local filetype = vim.api.nvim_eval('&ft')
    local lang = vim.treesitter.language.get_lang(filetype)
    M.intall(lang)
    M.start()
end

function M.init()
    vim.api.nvim_set_hl(0, "@identifier", { fg = "NONE" })
    vim.api.nvim_set_hl(0, "@variable", { fg = "NONE" })
    vim.api.nvim_set_hl(0, "@function", { fg = "#0087ff" })
    vim.api.nvim_set_hl(0, "@function.call", { fg = "#0087ff" })
    vim.api.nvim_set_hl(0, "@operator", { fg = "#d75f00" })
    vim.api.nvim_set_hl(0, "@keyword.operator", { fg = "#d75f00" })
    vim.api.nvim_set_hl(0, "@property", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@field", { fg = "#afd7af" })
    vim.api.nvim_set_hl(0, "@method", { fg = "#d75f00" })
    vim.api.nvim_set_hl(0, "@method.call", { fg = "#ff0000" })
    vim.api.nvim_set_hl(0, "@parameter", { fg = "#ff0000" })
    vim.api.nvim_set_hl(0, "@keyword", { fg = "#ff6666" })
    vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#0087ff" })
    vim.api.nvim_set_hl(0, "@exception", { fg = "#0087ff" })
    vim.api.nvim_set_hl(0, "@statement", { fg = "#d75f00" })
    vim.api.nvim_set_hl(0, "@special", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@comment", { fg = "#5faf5f", italic = true })
    vim.api.nvim_set_hl(0, "@include", { fg = "#800000" })
    vim.api.nvim_set_hl(0, "@type", { fg = "#d7af5f" })
    vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#afd7af" })
    vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#afd7d7" })
    vim.api.nvim_set_hl(0, "@constructor", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@namespace", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@string", { fg = "#00afaf" })
    vim.api.nvim_set_hl(0, "@number", { fg = "#00afaf" })
    vim.api.nvim_set_hl(0, "@boolean", { fg = "#00afaf" })
    vim.api.nvim_set_hl(0, "@tag", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#d75f00" })
    vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#afd7af" })
    vim.api.nvim_set_hl(0, "@conditional.ternary", { fg = "#800000" })
    vim.api.nvim_set_hl(0, "@punctuation.special", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@text.literal", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "@text.todo.unchecked", { fg = "#d78700" })
    vim.api.nvim_set_hl(0, "@text.todo.checked", { fg = "#00afaf" })
    vim.api.nvim_set_hl(0, "@markup.heading.1", { fg = "#87d7ff", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.2", { fg = "#00afff", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.3", { fg = "#afafff", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.4", { fg = "#d78700", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.5", { fg = "#d7af5f", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.6", { fg = "#ff0000", bold = true })
    vim.api.nvim_set_hl(0, "@markup.raw.block@label", { fg = "#008000" })
    vim.api.nvim_set_hl(0, "@markup.raw.block", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "@markup.quote", { fg = "#5faf5f", italic = true })
    vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })
    vim.api.nvim_set_hl(0, "@markup.bold", { bold = true })
    vim.api.nvim_set_hl(0, "@markup.strikethrough", { strikethrough = true })
    vim.api.nvim_set_hl(0, "@markup.link", { fg = "#afafff", underline = true })
    vim.api.nvim_set_hl(0, "@markup.list", { fg = "#5fafd7" })
    vim.api.nvim_set_hl(0, "Todo", { fg = "#1c1c1c", bg = "#00afd7", bold = true })
    vim.api.nvim_set_hl(0, "TodoText", { fg = "#00afd7", bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, "Note", { fg = "#1c1c1c", bg = "#5fd787", bold = true })
    vim.api.nvim_set_hl(0, "NoteText", { fg = "#5fd787", bg = 'NONE', bold = true })
    vim.cmd([[call matchadd('Todo', 'TODO!*:\{0,1\}')]])
    vim.cmd([[call matchadd('TodoText', 'TODO!*:\{0,1\}\zs.*')]])
    vim.cmd([[call matchadd('Note', 'NOTE!*:\{0,1\}')]])
    vim.cmd([[call matchadd('NoteText', 'NOTE!*:\{0,1\}\zs.*')]])
end

function M.config()
    require('nvim-treesitter').setup()
    local langs = { 'typescript', 'javascript', 'vue', 'go', 'lua', 'markdown', 'markdown_inline' }
    for idx in pairs(langs) do M.intall(langs[idx]) end
    vim.cmd([[ au FileType * lua require('plugins/tree-sitter').M.parser_bootstrap() ]])
    vim.cmd([[ au BufRead,BufNewFile * lua require('plugins/tree-sitter').M.start() ]])
    M.parser_bootstrap()
end

return { "nvim-treesitter/nvim-treesitter", build = ':TSUpdate', init = M.init, config = M.config, M = M }
