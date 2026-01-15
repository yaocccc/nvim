local G = require('G')
local M = {}

function M.config()
    G.hi({
        ["CopilotSuggestion"] = { fg = "#6e6e6e", italic = false },
    })
end

function M.setup()
    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = false,
            debounce = 15,
            trigger_on_accept = true,
            keymap = {
                accept = "<Right>",
                next = "<C-down>",
                prev = "<c-up>",
                accept_word = false,
                accept_line = false,
                dismiss = "false",
                toggle_auto_trigger = false,
            },
        },
    })
end

return M
