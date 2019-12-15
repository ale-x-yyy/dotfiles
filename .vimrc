" .vimrc by azh @ 2020
"

filetype off			" disable file type recognition (required by Vundle)
set nocompatible        " no compatible mode with vi (required by Vundle)

" initialize runtime path for Vundle and initialize it
set rtp +=~/.vim/bundle/vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" completion for Unicode glyphs
Plugin 'chrisbra/unicode.vim'

" completion for Python
Plugin 'davidhalter/jedi-vim'

" superatab insertion
Plugin 'ervandew/supertab'

call vundle#end()

filetype plugin indent on   " required by Vundle
syntax enable               " enable syntax processing

" colors
set rtp +=~/.vim/colors
colorscheme badwolf

set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " number of spaces to use for auto indent
set expandtab               " enter spaces when tab is pressed
set autoindent              " copy indent from current line when starting a new line

set textwidth=120           " break lines when line length increases
set showmatch               " highlight matching [{()}]

set number                  " show line numbers
set showcmd                 " show command in bottom bar
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when we need to
set virtualedit=onemore     " allow to go one character behind the end of the line
setlocal shortmess+=c       " supress omnicompletion status messages

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" change the <leader> key (default \)
let mapleader = ","

" supertab from the 1st element
let g:SuperTabDefaultCompletionType = "<c-n>"
" disable docstring window during completion
autocmd FileType python setlocal completeopt-=preview
