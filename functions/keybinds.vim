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

fun! VerifyDelete(file)
	if a:file != "" && filereadable(a:file)
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

fun! VerifyExit(file)
	let l:message = Confirm('Are you sure you want to quit Popcorn Vim? (Y/N): ')

	if l:message ==? 1
		exe "q!"
	elseif l:message ==? 0
		echom "Aborted"
		call feedkeys(" ")
	endif
endfun


