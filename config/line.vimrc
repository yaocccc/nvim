augroup lines
    au!
    au VimEnter * call SetStatusline()
    au VimEnter * call <SID>setEveryMinuteTimer()
    au BufEnter,BufWritePost,TextChanged,TextChangedI * call SetTabline()
augroup END

let g:currentmode={ "n": "NORMAL", "v": "VISUAL", "V": "V-LINE", "\<c-v>": "V-CODE", "i": "INSERT", "R": "R", "r": "R", "Rv": "V-REPLACE", "c": "CMD-IN", "s": "SELECT", "S": "SELECT", "\<c-s>": "SELECT", "t": "TERMINAL"}
hi User1 ctermbg=24
hi User2 ctermbg=238
hi User3 ctermbg=25

func! SetStatusline(...)
    let &statusline = '%1* %{g:currentmode[mode()]} %* %2* %{Err_num()} %* %2*%{GitStatus()}%*%=%1* %{GetPathName()} %* %1* %P %L %l %*'
    func! Err_num()
        let info = get(b:, 'coc_diagnostic_info', {})
        return 'E' . get(info, 'error', 0)
    endf
    func! GitStatus()
        let head = fugitive#head()
        let [a, m, r] = GitGutterGetHunkSummary()
        return len(head) ? printf(' %s +%d ~%d -%d ', head, a, m, r) : ''
    endf
    func! GetPathName()
        let name = substitute(expand('%'), $PWD . '/', '', '')
        let name = substitute(name, '/Users/chenyc', '~', '')
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
    return ''
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

func! s:setEveryMinuteTimer()
    let remain_second = 60 - strftime("%S")
    call timer_start(remain_second * 1000, 'SetTablineTimerAndSetTabline')
    func! SetTablineTimerAndSetTabline(...)
        call SetTabline()
        call timer_start(60 * 1000, 'SetTabline', { 'repeat': 9999 })
    endf
endf
