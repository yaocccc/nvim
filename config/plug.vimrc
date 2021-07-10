" Plug
    call plug#begin('~/.config/nvim/plugged')
            Plug 'yianwillis/vimcdoc'
            Plug 'terryma/vim-expand-region'
            Plug 'lfv89/vim-interestingwords'
            Plug 'mg979/vim-visual-multi', {'branch': 'master'}
            Plug 'tpope/vim-dadbod'
            Plug 'kristijanhusak/vim-dadbod-ui', { 'on': ['DBUI'] }
            Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm i'  }
            Plug 'mzlogin/vim-markdown-toc', { 'on': ['GenTocGitlab'] }
            Plug 'neoclide/coc.nvim', {'branch': 'release'}
            Plug 'voldikss/vim-floaterm'
            Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
            Plug 'junegunn/fzf.vim'
            Plug 'nvim-treesitter/nvim-treesitter'
            Plug 'nvim-treesitter/playground'
            Plug 'yaocccc/vim-lines'
            Plug 'yaocccc/vim-surround'
            Plug 'yaocccc/vim-comment'
            Plug 'yaocccc/vim-hlchunk'
    call plug#end()

" Plug Setting
    " coc-vim
        " 插件列表
            let g:coc_global_extensions=[
                \ 'coc-tsserver',
                \ 'coc-html', 'coc-css',
                \ 'coc-clangd',
                \ 'coc-go',
                \ 'coc-lua',
                \ 'coc-vimlsp',
                \ 'coc-sh',
                \ 'coc-java',
                \ 'coc-json',
                \ 'coc-db',
                \ 'coc-prettier', 'coc-gist',
                \ 'coc-pairs', 'coc-snippets', 'coc-tabnine',
                \ 'coc-word',  'coc-markdownlint',
                \ 'coc-translator', 'coc-git'
                \ ]
        " maps
            nmap     <silent>       <F2>      <Plug>(coc-rename)
            nmap     <silent>       gd        <Plug>(coc-definition)
            nmap     <silent>       gy        <Plug>(coc-type-definition)
            nmap     <silent>       gi        <Plug>(coc-implementation)
            nmap     <silent>       gr        <Plug>(coc-references)
            nmap     <silent>       K         :call CocAction("doHover")<cr>
            nnoremap <silent>       <F3>      :silent CocRestart<cr>
            inoremap <silent><expr> <TAB>     pumvisible() ? "\<C-n>" : col('.') == 1 \|\| getline('.')[col('.') - 2] =~# '\s' ? "\<TAB>" : coc#refresh()
            inoremap <silent><expr> <s-tab>   pumvisible() ? "\<c-p>" : "\<s-tab>"
            inoremap <silent><expr> <cr>      pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
            nnoremap <silent>       <F9>      :CocCommand snippets.editSnippets<cr>
            nnoremap <silent><expr> <F4>      get(g:, 'coc_enabled', 0) == 1 ? ':CocDisable<cr>' : ':CocEnable<cr>'
            nmap     <silent>       <c-e>     :CocList diagnostics<cr>
        " coc-translator
            nmap     <silent>       mm        <Plug>(coc-translator-p)
            vmap     <silent>       mm        <Plug>(coc-translator-pv)
        " coc-git
            nmap     <silent>       (         <Plug>(coc-git-prevchunk)
            nmap     <silent>       )         <Plug>(coc-git-nextchunk)
            vmap     <silent>       ig        <Plug>(coc-git-chunk-inner)
            vmap     <silent>       ag        <Plug>(coc-git-chunk-outer)
            nmap     <silent><expr> C         get(b:, 'coc_git_blame', '') ==# 'Not committed yet' ? "<Plug>(coc-git-chunkinfo)" : "<Plug>(coc-git-commit)"
            nmap     <silent>       <leader>g :call coc#config('git.addGBlameToVirtualText',  !get(g:coc_user_config, 'git.addGBlameToVirtualText', 0)) \| call nvim_buf_clear_namespace(bufnr(), 1, 0, -1)<cr>
        " coc-prettier
            autocmd FileType javascript,typescript,json vmap <buffer> = <Plug>(coc-format-selected)
            autocmd FileType javascript,typescript,json nmap <buffer> = <Plug>(coc-format-selected)

    " vim-expand-region 快速选择
        " v扩大选择 V缩小选择
            vmap     <silent>       v         <Plug>(expand_region_expand)
            vmap     <silent>       V         <Plug>(expand_region_shrink)

    " 快速跳转 vim-interestingwords
        " 设置不同匹配词颜色不同
            let g:interestingWordsRandomiseColors = 1
            nnoremap <silent>       ff        :call InterestingWords('n')<cr>
            nnoremap <silent>       FF        :call UncolorAllWords()<cr>
            nnoremap <silent>       n         :call WordNavigation('forward')<cr>
            nnoremap <silent>       N         :call WordNavigation('backward')<cr>

    " floaterm
            au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif
            let g:floaterm_title = ''
            let g:floaterm_width = 0.8
            let g:floaterm_height = 0.8
            let g:floaterm_autoclose = 1
            let g:floaterm_opener = 'edit'
            hi! link FloatermBorder NONE
        " floaterm toggle by name and cmd
            func FTToggle(name, cmd, pre_cmd) abort
                if floaterm#terminal#get_bufnr(a:name) != -1
                    exec 'FloatermToggle ' . a:name
                else
                    exec a:pre_cmd
                    exec printf('FloatermNew --name=%s %s', a:name, a:cmd)
                endif
            endf
            nnoremap <silent>   <c-f> :call FTToggle('FILE', 'ranger', '')<cr>
            nnoremap <silent>   <c-b> :call FTToggle('DBUI', 'nvim +CALLDB', '')<cr>
            nnoremap <silent>   <c-t> :call FTToggle('TERM', '', "try \| call system('~/scripts/edit-profile.sh VIM_TEM_DIR " . $PWD . "') \| endtry")<cr>
            tmap <silent><expr> <c-f> &ft == "floaterm" ? printf('<c-\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('FILE') == bufnr('%') ? '' : '<c-f>') : "<c-f>"
            tmap <silent><expr> <c-b> &ft == "floaterm" ? printf('<c-\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('DBUI') == bufnr('%') ? '' : '<c-b>') : "<c-b>"
            tmap <silent><expr> <c-t> &ft == "floaterm" ? printf('<c-\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('TERM') == bufnr('%') ? '' : '<c-t>') : "<c-t>"

    " vim-dadbod
            " let g:dbs = [{ 'name': 'connection_name', 'url': 'mysql://user:password@host:port' }]
            let g:db_ui_save_location = '~/.config/zsh/cache'
            let g:db_ui_use_nerd_fonts = 1
            let g:db_ui_force_echo_notifications = 1
            let g:db_ui_table_helpers = {
            \   'mysql': {
            \     'List': 'SELECT * from `{schema}`.`{table}` LIMIT 100;',
            \     'Indexes': 'SHOW INDEXES FROM `{schema}`.`{table}`;',
            \     'Table Fields': 'DESCRIBE `{schema}`.`{table}`;',
            \     'Alter Table': 'ALTER TABLE `{schema}`.`{table}` ADD '
            \   }
            \ }
            com! CALLDB call DBUI()
            func DBUI()
                set laststatus=0 showtabline=0 nonu signcolumn=no nofoldenable
                exec 'DBUI'
            endf

    " markdown-preview-nvim
        " 使用surf浏览器预览
            let g:mkdp_browser = 'surf'
            let g:mkdp_markdown_css = '/home/chenyc/.config/nvim/colors/markdown.css'
            let g:mkdp_page_title = '${name}'
            let g:mkdp_preview_options = { 'hide_yaml_meta': 1, 'disable_filename': 1 }

    " markdown-toc-gen
            let g:vmt_fence_text = 'markdown-toc'

    " fzf
        " maps
            let g:fzf_preview_window = ['right:45%', 'ctrl-/']
            let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
            let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
            com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right:45%', 'ctrl-/'), <bang>0)
            nnoremap <silent>       <c-a>     :Ag<cr>
            nnoremap <silent>       <c-p>     :Files<cr>
            nnoremap <silent>       <c-h>     :History<cr>
            nnoremap <silent>       <c-l>     :BLines<cr>
            nnoremap <silent>       <c-g>     :GFiles?<cr>

    " 多游标
            let g:VM_theme                      = 'ocean'
            let g:VM_highlight_matches          = 'underline'
            let g:VM_maps                       = {}
            let g:VM_maps['Find Under']         = '<C-n>'
            let g:VM_maps['Find Subword Under'] = '<C-n>'
            let g:VM_maps['Select All']         = '<C-d>'
            let g:VM_maps['Select h']           = '<C-Left>'
            let g:VM_maps['Select l']           = '<C-Right>'
            let g:VM_maps['Add Cursor Up']      = '<C-Up>'
            let g:VM_maps['Add Cursor Down']    = '<C-Down>'
            let g:VM_maps['Add Cursor At Pos']  = '<C-x>'
            let g:VM_maps['Add Cursor At Word'] = '<C-w>'
            let g:VM_maps['Move Left']          = '<C-S-Left>'
            let g:VM_maps['Move Right']         = '<C-S-Right>'
            let g:VM_maps['Remove Region']      = 'q'
            let g:VM_maps['Increase']           = '+'
            let g:VM_maps['Decrease']           = '_'
            let g:VM_maps["Undo"]               = 'u'
            let g:VM_maps["Redo"]               = '<C-r>'

    " treesitter
            lua require('TS')
            nnoremap <silent> H :TSHighlightCapturesUnderCursor<CR>:call lines#refresh_statusline()<cr>

    " yaocccc
        " line
            let g:line_powerline_enable = 1
            let g:line_nerdfont_enable = 1
            let g:line_unnamed_filename='~'
            let g:line_statusline_getters = ['GitInfo', 'CocErrCount', 'GetFt']

            func! GitInfo()
                let [branch, diff] = [get(g:, 'coc_git_status', ''), get(b:, 'coc_git_status', '')]
                return (len(branch) ? printf(' %s ', branch) : ' none ') . (len(diff) ? printf('%s ', trim(diff)) : '')
            endf
            let CocErrCount = { -> printf(' E%d ', get(get(b:, 'coc_diagnostic_info', {}), 'error', 0)) }
            let GetFt = { -> printf(' %s ', len(&ft) ? &ft : '~') }

        " comment
            let g:vim_line_comments = { 'vim': '"', 'vimrc': '"', 'js': '//', 'ts': '//', 'java': '//', 'class': '//', 'c': '//', 'h': '//', 'go': '//', 'lua': '--' }
            let g:vim_chunk_comments = { 'js': ['/**', ' *', ' */'], 'ts': ['/**', ' *', ' */'], 'sh': [':<<!', '', '!'], 'md': ['```', ' ', '```'] }
            nnoremap <silent> ??           :NToggleComment<cr>
            vnoremap <silent> /       :<c-u>VToggleComment<cr>
            vnoremap <silent> ?       :<c-u>CToggleComment<cr>

        " hlchunk
            autocmd CursorMoved,CursorMovedI,TextChanged,TextChangedI,TextChangedP *.ts,*.js,*.go,*.c,*.json call HlChunk()

" some hook
" sudo pacman -S the_silver_searcher fd bat
