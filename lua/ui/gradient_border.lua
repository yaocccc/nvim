local M = {}

local function define_gradient_highlights()
    local colors = {
        "#87d7ff", "#87afff", "#af87ff", "#d787ff",
        "#ff87ff", "#ff87d7", "#ff87af", "#87d7ff"
    }
    for i, color in ipairs(colors) do
        vim.api.nvim_set_hl(0, "FloatBorderGradient" .. i, { fg = color })
    end
end

local is_defined = false

function M.get()
    if not is_defined then
        define_gradient_highlights()
        is_defined = true
    end
    return {
        { "╭", "FloatBorderGradient1" },
        { "─", "FloatBorderGradient2" },
        { "╮", "FloatBorderGradient3" },
        { "│", "FloatBorderGradient4" },
        { "╯", "FloatBorderGradient5" },
        { "─", "FloatBorderGradient6" },
        { "╰", "FloatBorderGradient7" },
        { "│", "FloatBorderGradient8" },
    }
end

return M
