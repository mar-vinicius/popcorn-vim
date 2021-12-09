fun! Confirm(msg)
    echo a:msg . ' '
    let l:answer = nr2char(getchar())

    if l:answer ==? 'y' || l:answer ==? 'Y'
        return 1
    elseif l:answer ==? 'n' || l:answer ==? 'N'
        return 0
    else
        echo 'Please enter "y/Y" or "n/N"'
        return Confirm(a:msg)
    endif
endfun


""" LEADERKEY
let mapleader = "\<Space>"
"""


""" FILE FINDER KEYBINDS
" Abre o Findr de arquivos
nnoremap <Leader><Leader> :Findr<cr>

" Abre o Findr de buffers
nnoremap <Leader>lb :FindrBuffers<cr>
"""


""" COPY, DELETE, CHANGE AND PASTE KEYBINDS
nnoremap dd "+dd
vnoremap d "+d

nnoremap cc "+cc
vnoremap c "+c

nnoremap yy "+yy
vnoremap y "+y

nnoremap p "+p
vnoremap p "+p
"""


""" FILE COMMANDS
fun! VerifyDelete()
	let l:message = Confirm('You are sure(y/n)?: ')

	if l:message ==? 1
		exe "!rm %"
		call feedkeys(":bw\<cr>")
		call feedkeys(" ")
	elseif l:message ==? 0
		echom "Aborting..."
		call feedkeys(" ")
	endif

endfun

" File save
nnoremap <Leader>fs :w<cr>

" File exit
nnoremap <Leader>fe :bw<cr>

" Delete file
nnoremap <Leader>fd :call VerifyDelete()<cr>
"""


""" GENERAL COMMANDS FOR VIM
fun! VerifyExit()
	let l:message = Confirm('You are sure(y/n)?: ')

	if l:message ==? 1
		exe "q!"
	elseif l:message ==? 0
		echom "Aborting..."
		call feedkeys(" ")
	endif
endfun

" Exit neovim
nnoremap <Leader>qq :call VerifyExit()<cr>

" New esc
nnoremap <Esc> :noh<cr>

" Vim Indent Lines

map <C-p> :IndentGuidesDisable<cr>
map <C-k> :IndentGuidesEnable<cr>
"""


