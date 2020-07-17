augroup lines
    au!
    au FileType * call s:getGit()
    au VimEnter * call SetStatusline()
    au VimEnter * call SetTablineTimer()
    au BufEnter,BufWritePost,TextChanged,TextChangedI * call SetTabline()
augroup END

let g:currentmode={ "n": "NORMAL", "v": "VISUAL", "V": "V-LINE", "\<c-v>": "V-CODE", "i": "INSERT", "R": "R", "r": "R", "Rv": "V-REPLACE", "c": "CMD-IN", "s": "SELECT", "S": "SELECT", "\<c-s>": "SELECT", "t": "TERMINAL"}
hi User1 ctermbg=24
hi User2 ctermbg=238
hi User3 ctermbg=25

let s:git_head = ''
func! s:getGit()
    let head = system(printf('cd %s && git branch | grep "*"', expand('%:h')))
    let s:git_head = head[0] ==# '*' ? head[2:len(head)-2] : ''
endf

func! SetStatusline(...)
    let &statusline = '%1* %{g:currentmode[mode()]} %* %2* %{GetErrCount()} %* %2*%{GetGitStatus()}%*%=%1* %{GetPathName()} %* %1* %4P %L %l %*'
    func! GetErrCount()
        let info = get(b:, 'coc_diagnostic_info', {})
        return 'E' . get(info, 'error', 0)
    endf
    func! GetGitStatus()
        if len(s:git_head) == 0
            return ''
        endif
        if get(g:, 'gitgutter_enabled', 0) == 0
            return printf(' %s ', s:git_head)
        else
            let [a, m, r] = GitGutterGetHunkSummary()
            return printf(' %s +%d ~%d -%d ', s:git_head, a, m, r)
        endif
    endf
    func! GetPathName()
        let name = substitute(expand('%'), $PWD . '/', '', '')
        let name = substitute(name, $HOME, '~', '')
        let name = len(name) ? name : '[未命名]'
        return name
    endf
endf

func! SetTabline(...)
    let &tabline = '%1* BUFFER %*'
    let i = 1
    while i <= bufnr('$')
        if bufexists(i) && buflisted(i)
            let &tabline .= '%' . i . '@Clicktab@'
            let &tabline .= i == bufnr('%') ? ' %3* ' : ' %2* '
            let name = (len(fnamemodify(bufname(i), ':t')) ? fnamemodify(bufname(i), ':t') : '[未命名]') . (getbufvar(i, '&mod')?'+':'')
            let &tabline .=  name . ' %*%X'
        endif
        let i += 1
    endwhile
    let &tabline .= ' %<%=%1* %{strftime("周%a %p%I:%M")} %*'
endf

func! Clicktab(minwid, clicks, button, modifiers) abort
    let timerID = get(s:, 'clickTabTimer', 0)
    if a:clicks == 1 && a:button is# 'l'
        if timerID == 0
            let s:clickTabTimer = timer_start(100, 'SwitchTab')
            let timerID = s:clickTabTimer
        endif
    elseif a:clicks == 2 && a:button is# 'l'
        silent execute 'bd' a:minwid
        let s:clickTabTimer = 0
        call timer_stop(timerID)
        call SetTabline()
    endif
    let s:minwid = a:minwid
    let s:timerID = timerID
    func! SwitchTab(...)
        silent execute 'buffer' s:minwid
        let s:clickTabTimer = 0
        call timer_stop(s:timerID)
    endf
endf

func! SetTablineTimer()
    let remain_second = 60 - strftime("%S")
    call timer_start(remain_second * 1000, 'SetTablineTimerAndSetTabline')
    func! SetTablineTimerAndSetTabline(...)
        call SetTabline()
        call timer_start(60 * 1000, 'SetTabline', { 'repeat': 9999 })
    endf
endf
