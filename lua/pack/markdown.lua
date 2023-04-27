local G = require('G')
local M = {}

function M.config()
    G.g.mkdp_browser = 'wyeb'
    G.g.mkdp_markdown_css = '~/.config/nvim/colors/markdown.css'
    G.g.mkdp_page_title = '${name}'
    G.g.mkdp_preview_options = { hide_yaml_meta = 1, disable_filename = 1 }
    G.g.mkdp_theme = 'dark'
    G.g.vmt_fence_text = 'markdown-toc'
end

function M.setup()
    -- do nothing
end

function M.setup_headlines()
    G.hi({
        ["MDH1"] = { bg = 236, fg = 199, bold = true },
        ["MDH2"] = { bg = 235, fg = 202, bold = false },
        ["MDH3"] = { bg = 'none', fg = 37, bold = false },
        ["MDH4"] = { bg = 'none', fg = 29, bold = false },
        ["MDH5"] = { bg = 'none', fg = 25, bold = false },
        ["MDH6"] = { bg = 'none', fg = 24, bold = false },
        ["MDCodeBlock"] = { bg = 234 },
    })
    require('headlines').setup({
            markdown = {
                query = G.treesitter.query.parse(
                'markdown',
                [[
                    (atx_heading [
                        (atx_h1_marker)
                        (atx_h2_marker)
                        (atx_h3_marker)
                        (atx_h4_marker)
                        (atx_h5_marker)
                        (atx_h6_marker)
                    ] @headline)
                    (fenced_code_block) @codeblock
                    (block_quote_marker) @quote
                    (block_quote (paragraph (inline (block_continuation) @quote)))
                ]]),
                headline_highlights = { "MDH1", "MDH2", "MDH3", "MDH4", "MDH5", "MDH6" },
                codeblock_highlight = "MDCodeBlock",
                fat_headlines = false,
            },
        }
    )
end

return M
