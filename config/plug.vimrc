" Plug
    call plug#begin('~/.config/nvim/plugged')
        " 中文文档
            Plug 'yianwillis/vimcdoc'
        " 快速选择
            Plug 'terryma/vim-expand-region'
        " 快速跳转
            Plug 'lfv89/vim-interestingwords'
        " 多光标
            Plug 'mg979/vim-visual-multi', {'branch': 'master'}
        " coc
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
        " 括号高亮
            Plug 'luochen1990/rainbow'
            Plug 'Yggdroot/indentLine'
        " markdown
            Plug 'iamcco/markdown-preview.vim', {'for': ['markdown', 'vim-plug']}
        " fzf
        " brew install fzf
        " brew install the_silver_searcher
        " brew install fd
        " brew install bat
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
        " lsp + hl
            Plug 'pangloss/vim-javascript', {'for': ['javascript', 'vim-plug']}
        " :)
            Plug 'yaocccc/vim-lines'
            Plug 'yaocccc/vim-surround'
            Plug 'yaocccc/vim-comment'
    call plug#end()

" Plug Setting
    " coc-vim
        " CocToggle
            nnoremap <expr> <F4> get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'
        " 全局插件
            let g:coc_global_extensions=['coc-css', 'coc-html', 'coc-tsserver', 'coc-vetur', 'coc-word', 'coc-explorer', 'coc-markdownlint', 'coc-pairs', 'coc-snippets', 'coc-tabnine', 'coc-translator', 'coc-git']
        " com-rename
            nmap <silent>       <F2>     <Plug>(coc-rename)
            nmap <silent>       <F9>     :CocCommand snippets.editSnippets<CR>
            imap <silent><expr> <TAB>     pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
            imap <silent><expr> <S-TAB>   pumvisible() ? "\<C-p>" : "\<C-h>"
            imap <silent><expr> <c-space> coc#refresh()
            imap <silent><expr> <CR>      pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
            func! s:check_back_space() abort
                let l:col = col('.') - 1
                return !l:col || getline('.')[l:col - 1] =~# '\s'
            endf
        " Use `[g` and `]g` to navigate diagnostics
            nmap <silent> gd <Plug>(coc-definition)
            nmap <silent> gy <Plug>(coc-type-definition)
            nmap <silent> [g <Plug>(coc-diagnostic-prev)
            nmap <silent> ]g <Plug>(coc-diagnostic-next)
            nmap <silent> K :call CocAction("doHover")<cr>
        " coc-translator 显示翻译
            nmap <silent> mm <Plug>(coc-translator-p)
            xmap <silent> mm <Plug>(coc-translator-pv)
            smap <silent> mm <c-g><Plug>(coc-translator-pv)
        " coc-git
            nmap <silent> C         <Plug>(coc-git-commit)
            nmap <silent> (         <Plug>(coc-git-prevchunk)
            nmap <silent> )         <Plug>(coc-git-nextchunk)
            nmap <silent> <leader>g <Plug>(coc-git-chunkinfo)
            xmap <silent> ig        <Plug>(coc-git-chunk-inner)
            xmap <silent> ag        <Plug>(coc-git-chunk-outer)
        " coc-explorer
            nnoremap <silent> tt :CocCommand explorer --preset floating<CR>
            au User CocExplorerOpenPre  hi Pmenu ctermbg=NONE
            au User CocExplorerQuitPost hi Pmenu ctermbg=238
            au User CocExplorerQuitPost echo

    " vim-expand-region 快速选择
        " v扩大选择 V缩小选择
            xmap <silent> v <Plug>(expand_region_expand)
            xmap <silent> V <Plug>(expand_region_shrink)
            smap <silent> v <c-g><Plug>(expand_region_expand)
            smap <silent> V <c-g><Plug>(expand_region_shrink)

    " js-beautify  npm i js-beautify -g
            let g:javascript_plugin_jsdoc = 1
            smap <silent> = <c-g>:!js-beautify<CR>
            xmap <silent> = :!js-beautify<CR>
            nmap <silent> = :.!js-beautify<CR>

    " rainbow & indentline
            let g:rainbow_active = 1
            let g:indentLine_char_list = ['|', '¦']

    " 快速跳转 vim-interestingwords
        " 设置不同匹配词颜色不同
            let g:interestingWordsRandomiseColors = 1
            nnoremap <silent> ff    :call InterestingWords('n')<CR>
            nnoremap <silent> FF    :call UncolorAllWords()<CR>
            nnoremap <silent> n     :call WordNavigation('forward')<CR>
            nnoremap <silent> N     :call WordNavigation('backward')<CR>

    " markdown
        " F7开始浏览器预览 F8关闭
            nnoremap <silent> <F7>  <Plug>MarkdownPreview
            inoremap <silent> <F7>  <Plug>MarkdownPreview
            nnoremap <silent> <F8>  <Plug>StopMarkdownPreview
            inoremap <silent> <F8>  <Plug>StopMarkdownPreview

    " fzf
        " maps
            command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
            nnoremap <silent> <c-a> :Ag<CR>
            nnoremap <silent> <c-t> :Files<CR>
            nnoremap <silent> <c-h> :History<CR>
            nnoremap <silent> <c-l> :BLines<CR>
            nnoremap <silent> <c-g> :GFiles?<CR>
            " 开着coc-explorer时无法打开fzf
            au User CocExplorerOpenPost nnoremap <c-a> <nop>
            au User CocExplorerOpenPost nnoremap <c-t> <nop>
            au User CocExplorerOpenPost nnoremap <c-h> <nop>
            au User CocExplorerOpenPost nnoremap <c-l> <nop>
            au User CocExplorerOpenPost nnoremap <c-g> <nop>
            au User CocExplorerQuitPost nnoremap <silent> <c-a> :Ag<CR>
            au User CocExplorerQuitPost nnoremap <silent> <c-t> :Files<CR>
            au User CocExplorerQuitPost nnoremap <silent> <c-h> :History<CR>
            au User CocExplorerQuitPost nnoremap <silent> <c-l> :BLines<CR>
            au User CocExplorerQuitPost nnoremap <silent> <c-g> :GFiles?<CR>

    " 多游标
            let g:VM_theme                      = 'ocean'
            let g:VM_highlight_matches          = 'underline'
            let g:VM_maps                       = {}
            let g:VM_maps['Find Under']         = '<C-n>'
            let g:VM_maps['Find Subword Under'] = '<C-n>'
            let g:VM_maps['Select All']         = '<c-d>'
            let g:VM_maps['Visual All']         = '<c-d>'
            let g:VM_maps["Select Cursor Down"] = '<M-Down>'
            let g:VM_maps["Select Cursor Up"]   = '<M-Up>'
            let g:VM_maps["Select l"]           = '<M-Right>'
            let g:VM_maps["Select h"]           = '<M-Left>'
            let g:VM_maps['Remove Region']      = 'q'
            let g:VM_maps['Increase']           = '+'
            let g:VM_maps['Decrease']           = '-'

    " yaocccc
        " gitlens
            "  let g:gitlens_interval = 100
        " comment
            nmap <silent> ??           :NSetComment<CR>
            xmap <silent> /       :<c-u>VSetComment<CR>
            smap <silent> /  <c-g>:<c-u>VSetComment<CR>
