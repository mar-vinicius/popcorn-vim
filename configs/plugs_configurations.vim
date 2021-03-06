"}}}}}} EVERFOREST CONFIGS
if has('termguicolors')
	set termguicolors
endif
set background=dark
let g:everforest_background = 'hard'
colorscheme everforest
"{{{{{{


"}}}}}} CONFIGURAÇÕES DE NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 70

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
"{{{{{{


"}}}}}} CONFIGURAÇÕES DE VIM AIRLINE
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='google_dark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' ClN:'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' LnN:'
let g:airline_symbols.maxlinenr = '|'
let g:airline_symbols.dirty='⚡'
"{{{{{{

"}}}}}} CONFIGURAÇÕES DE DASHBOARD
let g:dashboard_custom_header = [
	\'',
	\'',
	\'',
	\'',
	\'',
	\' @@@@@@@    @@@@@@   @@@@@@@    @@@@@@@   @@@@@@   @@@@@@@   @@@  @@@     @@@  @@@  @@@  @@@@@@@@@@  ', 
	\' @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@ @@@     @@@  @@@  @@@  @@@@@@@@@@@ ', 
	\' @@!  @@@  @@!  @@@  @@!  @@@  !@@       @@!  @@@  @@!  @@@  @@!@!@@@     @@!  @@@  @@!  @@! @@! @@! ', 
	\' !@!  @!@  !@!  @!@  !@!  @!@  !@!       !@!  @!@  !@!  @!@  !@!!@!@!     !@!  @!@  !@!  !@! !@! !@! ', 
	\' @!@@!@!   @!@  !@!  @!@@!@!   !@!       @!@  !@!  @!@!!@!   @!@ !!@!     @!@  !@!  !!@  @!! !!@ @!@ ', 
	\' !!@!!!    !@!  !!!  !!@!!!    !!!       !@!  !!!  !!@!@!    !@!  !!!     !@!  !!!  !!!  !@!   ! !@! ', 
	\' !!:       !!:  !!!  !!:       :!!       !!:  !!!  !!: :!!   !!:  !!!     :!:  !!:  !!:  !!:     !!: ', 
	\' :!:       :!:  !:!  :!:       :!:       :!:  !:!  :!:  !:!  :!:  !:!      ::!!:!   :!:  :!:     :!: ', 
	\'  ::       ::::: ::   ::        ::: :::  ::::: ::  ::   :::   ::   ::       ::::     ::  :::     ::  ', 
	\'  :         : :  :    :         :: :: :   : :  :    :   : :  ::    :         :      :     :      :   ', 
	\''
	\]

let g:dashboard_custom_footer = [
			\ '',
			\ 'Special thanks to the plugin developers of which i use their code in my project.',
			\]

let g:dashboard_custom_section={
	\ 'github': {
		\ 'description': ['Github of the project.'],
		\ 'command': 'silent !xdg-open https://github.com/mar-vinicius/popcorn-vim &'},
	\ 'keybinds': {
		\ 'description': ['Keybinds documentation.'],
		\ 'command': 'view ~/.config/nvim/texts/commands.txt'},
	\ 'private_files': {
		\ 'description': ['Configuration files.'],
		\ 'command': 'Findr ~/.config/nvim/configs/'},
	\ }

"{{{{{{


"}}}}}} CONFIGURAÇÕES DE FINDR
let g:findr_border = {
    \   'top':    ['┌', '─', '┐'],
    \   'middle': ['│', ' ', '│'],
    \   'bottom': ['└', '─', '┘'],
    \ }
let g:findr_shorten_path = 1
"{{{{{{


"}}}}}} CONFIGURAÇÕES DE VIM INDENT GUIDES
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

autocmd VimEnter * call IdentManager()
autocmd BufReadPost * call IdentManager()
autocmd BufEnter * call EmptyBuffer()
"{{{{{{

"}}}}}} CONFIGURAÇÕES DE VIMSENSE
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editing: {}'
let g:vimsence_editing_state = 'Working on: {}'
let g:vimsence_file_explorer_text = 'In NERDTree'
let g:vimsence_file_explorer_details = 'Looking for files'
"{{{{{{
