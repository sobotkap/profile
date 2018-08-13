" (_)_ __ (_) |___   _(_)_ __ ___  
" | | '_ \| | __\ \ / / | '_ ` _ \ 
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|

" ==================== Mini Plug =================

packadd minpac
call minpac#init()

" autocomplete - deoplete 
call minpac#add('Rip-Rip/clang_complete')

" ale - linter / autocompletion / formatter
call minpac#add('w0rp/ale')

" auto formatter
call minpac#add('rhysd/vim-clang-format')

" nerd tree
call minpac#add('scrooloose/nerdtree')

" nerd commenter
call minpac#add('scrooloose/nerdcommenter')

" airline (powerline)
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" enhanced highlight
call minpac#add('octol/vim-cpp-enhanced-highlight')

" UltiSnips
call minpac#add('SirVer/ultisnips')

" easy motion
call minpac#add('easymotion/vim-easymotion')

" A - for switching between source and header files
call minpac#add('vim-scripts/a.vim')

" colorscheme
call minpac#add('lifepillar/vim-solarized8')

" glsl color
call minpac#add('tikhomirov/vim-glsl')

" ================ Suggestions ======================
 
" show wild menu (menu of suggestions) when typing commands in command mode
set path+=**
set wildmenu
set showcmd


" ================ File management ==================
 
" Turn off swap files
set noswapfile
set nobackup
set nowb
 
" TODO: improve behaviour
" reload files changed outside vim
set autoread
" Triger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None


" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default


" ================ Srolling =========================

" Start scrolling when we're 8 lines away from margins
set scrolloff=8

 
" ================ Encoding =========================
"set encoding to utf8
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif

" ================ Keyboard bindings ================
 
" noremap - no recursive mapping

" set the leader key to comma
let mapleader = '\<SPACE>'

" clipboard
" copy
noremap <C-c> "+y
" paste
noremap <C-v> "+p
" cut
noremap <C-x> "+d
" paste in insert mode
inoremap <C-v> <Esc>"+pa

" fast scrolling
nnoremap J 10j
nnoremap K 10k

" stay in normal mode after inserting a new line
noremap o o <Bs><Esc>
noremap O O <Bs><Esc>

" mapping that opens .vimrc in a split for quick editing
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" mapping that sources the vimrc in the current file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Mapping U to Redo.
noremap U <c-r>
noremap <c-r> <NOP>

" Terminal
noremap <A-t> :terminal<CR>:set hidden<CR>
tnoremap <A-p> <C-\><C-n>:bnext<CR>
tnoremap <A-p> <C-\><C-n>:bprevious<CR>
tnoremap <A-[> <C-\><C-n>

" ================ Visualization ====================
 
syntax on
set background=dark
colorscheme solarized8

" ================ Indentation ======================

set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab


" ================ Number column ====================
 
" numbers
set number " see the line number column

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu
" we don't want to see relative numbering while debugging
" debugger uses its own window, so we can disable rnu when source window loses
" focus
autocmd BufLeave * :set nornu
autocmd BufEnter * call SetRNU()
function! SetRNU()
    if(mode()!='i')
        set rnu 
    endif
endfunction


" ================ Searching ========================

" Ignorecase when searching
set ignorecase

" incremental search - Vim starts searching when we start typing
set incsearch

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>


" ================ Performance ======================

" fix slow scrolling that occurs when using mouse and relative numbers
set lazyredraw
" vim timeout (forgot why I need this or if I do at all)
set ttyfast
set ttimeoutlen=10


" ================ Abbreviations ====================

iab wiht with
iab whit with
iab ture true
iab flase false
iab wieght weight
iab hieght height
iab tihs this
iab mian main


" ================ Misc =============================

" highlight matching braces
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=0

" When the last window will have a status line (2 = always)
set laststatus=2

" disable wrapping of long lines into multiple lines
set nowrap

" history
set history=1000

" on some systems the backspace does not work as expected.
" this fixes the problem
set backspace=indent,eol,start

"disable preview window
set completeopt-=preview


" ================ Plugins ==========================

" ################ Airline ##########################

" vim airline fonts
if !exists('g:airline_symbols')
	let g:airline_symbols= {}
endif

" unicode symbols
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1


" ################ NERDTree #########################
 
" shift+i (show hidden files)
 
" ctrl+n open/closes nerd tree
noremap <C-n> :NERDTreeToggle<CR>

" quit nerd tree on file open
let g:NERDTreeQuitOnOpen = 1

" show nerd tree always on the right instead on the left
let g:NERDTreeWinPos = "right"

" ################ UltiSnips ########################

" make a dir Ultisnips in: '~/.config/nvim/UltiSnips/'
" and put your snippets in there
" eg. cpp.snippets

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsUsePythonVersion = 3


" ################ Clang complete ###################

"let g:clang_use_library = 1
"let g:clang_library_path='/usr/lib/llvm-5.0/lib/libclang.so.1'
"let g:clang_periodic_quickfix=1
"let g:clang_auto_select = 1

"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'ultisnips'

" I don't know how to change the keybindings to navigate
" the 'completion suggestions menu' with ctrl+k and ctrl+l
"inoremap <C-k> <Down>
"inoremap <C-l> <Up>

 
" ################ Ale ##############################
 
" autocompletion
let g:ale_completion_enabled = 1

let g:ale_cpp_clang_executable = 'clang++'

" linter
 let g:ale_linters = {
            \   'cpp': ['clang']
            \}
let g:ale_cpp_clang_options = '-std=c++11 -O0 -Wextra -Wall -Wpedantic -I /usr/include/eigen3'
"let g:ale_cpp_clangtidy_options = '-checks="cppcoreguidelines-*"'
"let g:ale_cpp_cpplint_options = ''
"let g:ale_cpp_gcc_options = ''
"let g:ale_cpp_clangcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''


" ################ Clang format #####################
 
" Clang format - auto formatting
 
let g:clang_format#command = 'clang-format'
"let g:clang_format#style_options = {
"            \ "BreakBeforeBraces" : "Attach",
"            \ "UseTab" : "Never",
"            \ "IndentWidth" : 4,
"            \ "ColumnLimit" : 100,
"            \ "AccessModifierOffset" : -4,
"            \ "AllowShortIfStatementsOnASingleLine" : "false",
"            \ "AllowShortFunctionsOnASingleLine" : "false",
"            \}

" shortcuts for autoformatting the entire file: Ctrl+j
inoremap <C-j> <Esc>:ClangFormat<CR>a
nnoremap <C-j> <Esc>:ClangFormat<CR>


" ################ A ################################
 
" A - switching between files
 
" header / source
nnoremap <F4> :A<CR>
inoremap <F4> <ESC>:A<CR>a

" file under cursor
nnoremap <F2> :IH<CR>
inoremap <F2> <ESC>:IH<CR>


" ################ Easymotion #######################
 
" shift the keys 1 to the right so they match my jklč config
map <leader><leader>j <Plug>(easymotion-linebackward)
map <leader><leader>k <Plug>(easymotion-j)
map <leader><leader>l <Plug>(easymotion-k)
map <leader><leader>č <Plug>(easymotion-lineforward)


" TODO: add (cmake) project support

" ----------------
"  FILETYPE SETUP
" ----------------
augroup filetypes
  autocmd!


  " Documentation
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
  autocmd FileType md setlocal wrap textwidth=78
  autocmd FileType markdown setlocal wrap textwidth=78
  autocmd FileType rst setlocal wrap textwidth=78

  " Java
  autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 softtabstop=4

  " Javascript
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2

  " C/C++
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType cc setlocal shiftwidth=2 tabstop=2
  autocmd FileType C setlocal shiftwidth=2 tabstop=2
  autocmd FileType hpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType h setlocal shiftwidth=2 tabstop=2
augroup end
