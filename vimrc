" -----------------------------------------------------------------------------
" -- Begin Very Important Settings --------------------------------------------
" -----------------------------------------------------------------------------

" Note: These settings come first in vimrc as they affect many other settings

" Disable vi compatibility mode
set nocompatible

" Map <leader> key from backslash to comma to keep fingers on home row
let mapleader = "," 

" Load pathogen plugin, which will load all other plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Use pathogen plugin to automatically generate helptags for all plugins.
execute pathogen#helptags()

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

" Customize the status bar
set statusline =[%F]%m%r\ %=
set statusline +=%{fugitive#statusline()} " Fugitive / Git
set statusline +=\ [%l\ /\ %L]\ [%p%%]\ [%v]

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

set backspace=2  " Allow backspace over autoindent, line break, and insert
set expandtab    " Expand tabs to spaces
set shiftwidth=2 " Indents are 2 spaces wide
set tabstop=2    " Tabs are 2 spaces wide
set textwidth=79 " Hard-wrap lines longer than 79 characters (insert newlines)

" -----------------------------------------------------------------------------
" -- End Formatting Settings --------------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Search Settings ----------------------------------------------------
" -----------------------------------------------------------------------------

set hlsearch   " Highlight search results
set ignorecase " Case insensitive searches
set incsearch  " Searches as I type
set smartcase  " Only search terms with uppercase characters are case sensitive
set wrapscan   " Searches wrap at end of file

" Toggle search highlighting and display the result in the status bar
nnoremap <leader>hl :set hlsearch! hlsearch?<cr> 

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

" Clear any previous spellcheck highlighting
" Note: These must come after any colorscheme settings
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal

" Set new spellcheck highlighting
" Note: These must come after any colorscheme settings
hi SpellBad   term=underline cterm=underline ctermfg=red
hi SpellCap   term=underline cterm=underline
hi SpellRare  term=underline cterm=underline
hi SpellLocal term=underline cterm=underline

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

" Force myself to use ii for escape: it'll work until I want to go skiing... =)
inoremap ii <esc>
inoremap <esc> <nop>

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
" working directory (helps with git repositories)
set directory^=$HOME/.vim_swap//

" Show command line autocomplete options in the status bar
set wildmenu

" Enhanced tab completion on the command line
set wildmode=longest,list,full

" Hard-wrap lines in git commit buffer after 72 characters.
au FileType gitcommit set tw=72

" -----------------------------------------------------------------------------
" -- End Miscellaneous Settings -----------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin CommandT Plugin Settings -------------------------------------------
" -----------------------------------------------------------------------------

" Explicitly create the default mappings (fixes bug after remapping leader key)
nnoremap <silent> <Leader>t :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" <esc> key exits CommandT
let g:CommandTCancelMap='<esc>'

" Auto-rebuild the index when a new file is created, so it can be found
if has('autocmd')
  augroup NFUCT
      autocmd!
      autocmd BufWritePre * call NFUCTset()
  augroup END
  function! NFUCTset()
      if !filereadable(expand('%'))
          augroup NFUCT
              autocmd BufWritePost * call NFUCT()
          augroup END
      endif
  endfunction
  function! NFUCT()
      augroup NFUCT
          autocmd!
          autocmd BufWritePre * call NFUCTset()
      augroup END
      CommandTFlush
  endfunction
endif

" -----------------------------------------------------------------------------
" -- End CommandT Plugin Settings ---------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin CamelCase Plugin Settings ------------------------------------------
" -----------------------------------------------------------------------------

" w, b, and e keys use camelCase motion
" Note: ge is not implented
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" -----------------------------------------------------------------------------
" -- End CamelCase Plugin Settings --------------------------------------------
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
" -- Begin Eclim Plugin Settings ----------------------------------------------
" -----------------------------------------------------------------------------

" Disable broken eclim taglist (use default taglist instead)
let g:EclimTaglistEnabled=0

" Auto-open the project tree view if the current file is in an Eclipse project
let g:EclimProjectTreeAutoOpen=1 

" Expand the project tree automatically when it is opened
let g:EclimProjectTreeExpandPathOnOpen=1

" Use the same project tree in all tabs
let g:EclimProjectTreeSharedInstance=1

" Use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

" -----------------------------------------------------------------------------
" -- End Eclim Plugin Settings ------------------------------------------------
" -----------------------------------------------------------------------------
