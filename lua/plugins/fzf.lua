return {
    "ibhagwan/fzf-lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    keys = {
        { "<c-p>", mode = "n", function() require("fzf-lua").files({ cwd = os.getenv("PWD") }) end,                     desc = "Find Files" },
        { "<c-a>", mode = "n", function() require("fzf-lua").live_grep({ cwd = os.getenv("PWD") }) end,                 desc = "Live Grep" },
        { "<c-b>", mode = "n", function() require("fzf-lua").buffers() end,                                             desc = "Buffers" },
        { "<c-l>", mode = "n", function() require("fzf-lua").blines() end,                                              desc = "Buffer Lines" },
        { "<c-g>", mode = "n", function() require("fzf-lua").git_status({ cwd = os.getenv("PWD") }) end,                desc = "Git Status" },
        { "<c-h>", mode = "n", function() require("fzf-lua").oldfiles({ cwd = os.getenv("PWD"), cwd_only = true }) end, desc = "Old Files" },
    },
    opts = {
        hls = {
            border = "FloatBorder",
            scrollbar_f = "FzfLuaScrollBorderFull",
            scrollbar_e = "FzfLuaScrollBorderEmpty",
        },
        winopts = {
            border = require("ui/gradient_border").get(),
            preview = {
                border = require("ui/gradient_border").get()
            }
        }
    }
}
