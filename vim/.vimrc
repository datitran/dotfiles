" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'duff/vim-trailing-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/seoul256.vim'
Plugin 'ajh17/vimcompletesme'
Plugin 'scrooloose/nerdcommenter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jiangmiao/auto-pairs'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'davidhalter/jedi-vim'
Plugin 'shougo/neocomplete.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" All settings should be after Vundle due to loading of plugins

" Global settings
" Enable syntax highlighting
syntax enable
" Show line numbers
set number
" Tabs are 2 spaces
set ts=2
" Backspace over everything in insert mode
set bs=2
" Softtabsstops are 2 spaces
set softtabstop=2
" Tabs under smart indent
set shiftwidth=2
" Expand tabs into spaces
set expandtab
" Indent when moving to the next line
set autoindent
" Show a visual line under the cursor's current line
set cursorline
" Show a vertical line at the cursor's current line
set cursorline cursorcolumn
" Disable cursor blink
set gcr=a:blinkon0
" Show the matching part of the pair for [] {} and ()
set showmatch
" Set default encoding to UTF-8
if !has('nvim')
  set encoding=utf-8
endif
" Set theme and colorscheme
let g:seoul256_background = 233
colo seoul256
" Set different theme for GUI and background depending on time
let hour = strftime("%H")
if 6 <= hour && hour < 18
  if has('gui_running')
    colo solarized
    set background=light
  endif
else
  if has('gui_running')
    colo solarized
    set background=dark
  endif
endif
" Set fonttype and size
set guifont=Input\ Mono\ Condensed:h13
" Let airline appear all the time
set laststatus=2
" Set no max file limit
let g:ctrlp_max_files = 25000
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0
" Relative path if invoking ctrlp
let g:ctrlp_default_input = 1
" Enable indent guides on startup
let g:indent_guides_enable_on_vim_startup = 1
" Reduce guide size
let g:indent_guides_guide_size = 1
" Start at different level
let g:indent_guides_start_level = 2
" Autocolor the indent guide
let g:indent_guides_auto_colors = 1
" Control the transparency of the color
let g:indent_guides_color_change_percent = 2
" Exclude some files from indent guide, do :set filetype? for additional types
let g:indent_guides_exclude_filetypes = ['help', 'text', 'sql', 'sh', 'vim']
" Toggle indent guide for python only once
"autocmd! FileType python IndentGuidesToggle

" Searching
" Highlight matches
set hlsearch
" Incremental searching
set incsearch

" List chars
set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

if has("gui_running")
  if has("autocmd")
    " Automatically resize splits when resizing MacVim window
    autocmd VimResized * wincmd =
  endif
endif

" Backup and swap files

" Create folders for backup and swap files first
" mkdir ~/.vim/.backup ~/.vim/.swp ~/.vim/.undo
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" User defined functions
" Set a ruler and highlight those characters that are over the ruler
function ShowRuler()
  setlocal colorcolumn=80
  call matchadd('ErrorMsg', '\%>80v.\+', -1)
endfunction

" Disable ruler and unhighlight those matches
function DisableRuler()
  setlocal colorcolumn=
  call clearmatches()
endfunction

" Python specific settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 " Set tabs to have 4 spaces
    \ set softtabstop=4 " Same as tabstop i.e. use tabs
    \ set shiftwidth=4 " Shift lines by 4 spaces
    \ set textwidth=79 " Break at 79
    \ set expandtab " Expand tabs into spaces
    \ set autoindent " Indent when moving to the next line
    \ set fileformat=unix

" Enable all Python syntax highlighting features
let python_highlight_all = 1

" Neocomplete and Jedi-Vim settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

autocmd FileType python setlocal omnifunc=jedi#completions completeopt-=preview
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
