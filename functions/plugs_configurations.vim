function! TabIsEmpty()
    " Remember which window we're in at the moment
    let initial_win_num = winnr()

    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction

fun! DashboardCorrect()
	call feedkeys("\<C-p>")
	exe "Dashboard"
endfun

fun! EmptyBuffer()
	let l:empty_buffer = line2byte('.') == -1 && len(tabpagebuflist()) == 1 && empty(bufname())
	if l:empty_buffer
		call DashboardCorrect()
	endif
endfun

fun! IdentManager()
	if TabIsEmpty() == 1
		call DashboardCorrect()
	else
		call feedkeys("\<C-k>")
	endif
endfun


