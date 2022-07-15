call plug#begin('~/.config/nvim/plugged')
    Plug 'yianwillis/vimcdoc'
    Plug 'terryma/vim-expand-region'
    Plug 'lfv89/vim-interestingwords'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui', { 'on': ['DBUI'] }
    Plug 'mzlogin/vim-markdown-toc', { 'on': ['GenTocGitlab'] }
    Plug 'voldikss/vim-floaterm'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'github/copilot.vim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'yaocccc/nvim-lines.lua'
    Plug 'yaocccc/vim-fcitx2en'
    Plug 'yaocccc/vim-surround'
    Plug 'yaocccc/vim-comment'
    Plug 'yaocccc/vim-showmarks'
call plug#end()

lua require'vim-expand-region'
lua require'vim-interestingwords'
lua require'vim-visual-multi'
lua require'vim-dadbod'
lua require'markdown-preview-nvim'
lua require'markdown-toc-gen'
lua require'vim-floaterm'
lua require'fzf-vim'
lua require'coc-nvim'
lua require'copilot'
lua require'tree-sitter'
lua require'nvim-lines'
lua require'vim-comment'

" some hook
" sudo pacman -S the_silver_searcher fd bat
