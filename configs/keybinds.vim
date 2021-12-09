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
fun! VerifyDelete(file)
	if a:file != "" && filereadable("SpecificFile")
		let l:message = Confirm('Are you sure you want to delete the "' . a:file . '" file? (Y/N): ')
	else
		echom "No file to delete or file not exists"
		return
	endif
	
	if l:message ==? 1
		exe "!rm %"
		call feedkeys(":bw\<cr>")
		call feedkeys(" ")
	elseif l:message ==? 0
		echom "Aborted"
		call feedkeys(" ")
	endif
endfun

fun! FileClose(file)
	if a:file != ""
		let l:message = Confirm('Are you sure you want to close the "' . a:file . '" file? (Y/N): ')
	else
		echom "No files to close"
		return
	endif

	if l:message ==? 1
		exe "bw"
		echom " "
	elseif l:message ==? 0
		echom "Aborted"
		call feedkeys(" ")
	endif
endfun

" File save
nnoremap <Leader>fs :w<cr>

" File exit
nnoremap <Leader>fc :call FileClose(expand('%:t'))<cr>

" Delete file
nnoremap <Leader>fd :call VerifyDelete(expand('%:t'))<cr>

" Show NERDTree
nnoremap <Leader>oe :NERDTreeToggle<cr>
"""


""" GENERAL COMMANDS FOR VIM
fun! VerifyExit(file)
	let l:message = Confirm('Are you sure you want to quit Popcorn Vim? (Y/N): ')

	if l:message ==? 1
		exe "q!"
	elseif l:message ==? 0
		echom "Aborted"
		call feedkeys(" ")
	endif
endfun

" Exit neovim
nnoremap <Leader>qq :call VerifyExit(expand('%:t'))<cr>

" New esc
nnoremap <Esc> :noh<cr>

" Vim Indent Lines
map <silent><C-p> :IndentGuidesDisable<cr>
map <silent><C-k> :IndentGuidesEnable<cr>
"""
