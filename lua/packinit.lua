require('packer').startup({function(use)
    use { 'wbthomason/packer.nvim' }
    use { 'yianwillis/vimcdoc' }
    use { 'terryma/vim-expand-region' }; require('pack/vim-expand-region')
    use { 'lfv89/vim-interestingwords' }; require('pack/vim-interestingwords')
    use { 'mg979/vim-visual-multi' }; require('pack/vim-visual-multi')
    use { 'tpope/vim-dadbod' }; require('pack/vim-dadbod')
    use { 'kristijanhusak/vim-dadbod-ui' }
    use { 'neoclide/coc.nvim', branch = 'release' }; require('pack/coc')
    use { 'voldikss/vim-floaterm' }; require('pack/vim-floaterm')
    use { 'junegunn/fzf', run = 'cd ~/.fzf && ./install --all', 'junegunn/fzf.vim' }; require('pack/fzf')
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', 'nvim-treesitter/playground' }; require('pack/tree-sitter')
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview', 'mzlogin/vim-markdown-toc' }; require('pack/markdown')
    use { 'kyazdani42/nvim-web-devicons', 'kyazdani42/nvim-tree.lua' }; require('pack/nvim-tree')
    use { 'yaocccc/vim-comment' }; require('pack/vim-comment')
    use { 'yaocccc/nvim-hlchunk', 'yaocccc/vim-fcitx2en', 'yaocccc/vim-surround', 'yaocccc/vim-showmarks' }
    use { 'yaocccc/nvim-lines.lua' }; require('pack/nvim-lines')
end, config = { git = { clone_timeout = 120 } }})
