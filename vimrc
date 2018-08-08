" -----------------------------------------------------------------------------
" -- Begin Very Important Settings --------------------------------------------
" -----------------------------------------------------------------------------

" Note: These settings come first in vimrc as they affect many other settings

" Disable vi compatibility mode
set nocompatible

" Map <leader> key from backslash to comma to keep fingers on home row
let mapleader = ","

" Load pathogen plugin (if it exists).
runtime! bundle/vim-pathogen/autoload/pathogen.vim
if exists("*pathogen#infect")
  " Use pathogen to load all other plugins.
  execute pathogen#infect()
  " Use pathogen plugin to automatically generate helptags for all plugins.
  execute pathogen#helptags()
endif

" -----------------------------------------------------------------------------
" -- End Very Important Settings ----------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Appearance Settings ------------------------------------------------
" -----------------------------------------------------------------------------

colorscheme elflord " Set the color scheme to the built-in 'elflord' scheme
set cmdheight=2     " Set the height of the command line to 2
set colorcolumn=81  " Display a red right-margin at column 81
set guioptions-=T   " Hide MacVim gui toolbar
set laststatus=2    " Always show the status bar
set mousehide       " Hide mouse while typing
set number          " Show line numbers in the left margin
set shortmess+=I    " Disable intro screen on startup
syntax on           " Enable syntax highlighting

" Simplify vimdiff color scheme
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Customize the status line
set statusline =[%F]%m%r\ %=
set statusline +=%{exists('g:loaded_fugitive')?fugitive#statusline():''} " Fugitive / Git
set statusline +=\ [%l\ /\ %L]\ [%p%%]\ [%v]
if &runtimepath =~ 'VisualSelectionSize'
  set statusline +=%(\ [%{VisualSelectionSize()}]%)
endif

" -----------------------------------------------------------------------------
" -- End Appearance Settings --------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Filetype Settings --------------------------------------------------
" -----------------------------------------------------------------------------

filetype on        " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins

" -----------------------------------------------------------------------------
" -- End Filetype Settings ----------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Formatting Settings ------------------------------------------------
" -----------------------------------------------------------------------------

set autoindent    " Indent all lines when formatting a paragraph
set backspace=2   " Allow backspace over autoindent, line break, and insert
set expandtab     " Expand tabs to spaces
set shiftwidth=2  " Indents are 2 spaces wide
set tabstop=2     " Tabs are 2 spaces wide
set textwidth=79  " Hard-wrap lines longer than 79 characters (insert newlines)
set tabpagemax=99 " Allow 99 tabs to be opened simultaneously (default is 10).

" Automatically strip all trailing whitespace on write
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" -----------------------------------------------------------------------------
" -- End Formatting Settings --------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Search Settings ----------------------------------------------------
" -----------------------------------------------------------------------------

set hlsearch   " Highlight search results
set ignorecase " Case insensitive searches
set smartcase  " Only search terms with uppercase characters are case sensitive
set incsearch  " Searches as I type
set wrapscan   " Searches wrap at end of file

" Toggle search highlighting and display the result in the status bar
nnoremap <leader>hl :set hlsearch! hlsearch?<cr>

" Make * and # searches case sensitive only with uppercase characters
":nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
":nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" -----------------------------------------------------------------------------
" -- End Search Settings ------------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Spelling Settings --------------------------------------------------
" -----------------------------------------------------------------------------

" Enable spell check
setlocal spell spelllang=en_us

" Toggle spell check and display the result in the status bar
nnoremap <leader>sp :set spell! spell?<cr>

" Set new spellcheck highlighting
" Note: These must come after any colorscheme settings
hi SpellBad   term=underline cterm=underline ctermbg=black ctermfg=red
hi SpellCap   term=underline cterm=underline ctermbg=black ctermfg=yellow
hi SpellRare  term=underline cterm=underline ctermbg=black ctermfg=magenta
hi SpellLocal term=underline cterm=underline ctermbg=black ctermfg=cyan

" -----------------------------------------------------------------------------
" -- End Spelling Settings ----------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Window Settings ----------------------------------------------------
" -----------------------------------------------------------------------------

" Move between vim windows while holding down ctrl and using h, j, k, l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Vim window focus does NOT follow the mouse pointer
set nomousefocus

" Vim windows split vertically to the right and horizontally to the bottom
set splitright
set splitbelow

" Set the height of the preview window (used by fugitive's :Gstatus & :Gcommit)
set previewheight=25

" -----------------------------------------------------------------------------
" -- End Window Settings ------------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Miscellaneous Settings ---------------------------------------------
" -----------------------------------------------------------------------------

" Disable Arrow Keys
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
nnoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>

" Yank, delete, and paste use the system clipboard
set clipboard=unnamed

" Edit vimrc in vertical split to the right of the current window
nnoremap <leader>ev :rightbelow vsplit $MYVIMRC<cr>

" Source vimrc to make any changes to itself take effect
nnoremap <leader>sv :source $MYVIMRC<cr>:echo "vimrc re-sourced"<cr>

" Disable auto comment insertion
if has('autocmd')
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif

" Disable audible and visual bells
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Show vim error messages
set debug=msg

" MacVim tabs
" Use CTRL + TAB to switch to next macvim tab
" Use CTRL + SHIFT + TAB to switch to previous macvim tab
" Use CTRL + t to open a new tab
noremap <c-tab> :tabnext<cr>
noremap <c-s-tab> :tabprevious<cr>
noremap <c-t> :tabnew<cr>

" Put vim swap files in one central directory so they don't clutter the
" working directory (helps with git repositories & network drives)
set directory=$HOME/.vim/_swap//
" Create swap file directory if it doesn't exist.
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Enable backup files and set their location
set backup
set backupdir=$HOME/.vim/_backup//
" Create backup file directory if it doesn't exist.
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

" Enable undo files and set their location
set undofile
set undodir=$HOME/.vim/_undo//
" Create undo file directory if it doesn't exist.
if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), "p")
endif

" Show command line autocomplete options in the status bar
set wildmenu

" Enhanced tab completion on the command line
set wildmode=longest,list,full

" Hard-wrap lines in git commit buffer after 72 characters.
au FileType gitcommit set tw=72

" Allow Command Key + jk0$ absolute navigation on soft-wrapped lines
vmap <D-j> gj
vmap <D-k> gk
vmap <D-0> g0
vmap <D-4> g$
nmap <D-j> gj
nmap <D-k> gk
nmap <D-0> g0
nmap <D-4> g$

" Make diffs split windows vertically
:set diffopt+=vertical

" CTRL + X / CTRL + A decrements / increments octal, hexadecimal, and alphanumeric characters, as well as decimal numbers.
":set nf=octal,hex,alpha

" -----------------------------------------------------------------------------
" -- End Miscellaneous Settings -----------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin CamelCase Plugin Settings ------------------------------------------
" -----------------------------------------------------------------------------

" Only configure if the plugin exists (was loaded by pathogen).
if &runtimepath =~ 'CamelCaseMotion'
  " w, b, and e keys use camelCase motion
  " Note: ge is not implented
  map <silent> w <Plug>CamelCaseMotion_w
  map <silent> b <Plug>CamelCaseMotion_b
  map <silent> e <Plug>CamelCaseMotion_e
  map <silent> ge <Plug>CamelCaseMotion_ge
  sunmap w
  sunmap b
  sunmap e
  sunmap ge
endif

" -----------------------------------------------------------------------------
" -- End CamelCase Plugin Settings --------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin vim-session Plugin Settings ----------------------------------------
" -----------------------------------------------------------------------------

" Only configure if the plugin exists (was loaded by pathogen).
if &runtimepath =~ 'vim-session'
  let g:session_directory = '~/.vim/_session'
  " Create session file directory if it doesn't exist.
  if !isdirectory(expand(session_directory))
    call mkdir(expand(session_directory), "p")
  endif
endif

" -----------------------------------------------------------------------------
" -- End vim-session Plugin Settings ------------------------------------------
" -----------------------------------------------------------------------------
