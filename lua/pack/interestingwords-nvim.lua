local G = require('G')
local M = {}

function M.config()
end

function M.setup()
    require("interestingwords").setup {
        colors = { '#aeee55', '#aa5522', '#225488', '#088823', '#eed724', '#bb3c7b', '#5478c0', '#047a89', '#a84247', '#ccf2e5' },
        search_count = false,
        navigation = false,
        scroll_center = true,
        color_key = "ff",
        cancel_color_key = "FF",
        select_mode = "random",  -- random or loop
    }
end

return M
