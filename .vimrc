" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"------------------------------------------------------------------------------
" Install vundle automatically
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
"------------------------------------------------------------------------------
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing vundle.."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let iCanHazVundle=0
endif

"------------------------------------------------------------------------------
" Vundle settings
"------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/The-NERD-tree'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------------------------
" Install vundle plugins automatically
"------------------------------------------------------------------------------
if iCanHazVundle == 0
	echo "Installing Plugins, please ignore key map error messages"
	echo ""
endif

"------------------------------------------------------------------------------
" General Settings
"------------------------------------------------------------------------------
" Enable syntax highlighting
syntax on

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

filetype on		" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting
filetype plugin on	" Enable filetype-specific plugins

" Visual support settings
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set number		" Show line number
set ruler		" Show the cursor position all the time
set cursorline		" Show the current line ruler
set colorcolumn=80	" Show a red line at column 80

" Seatch settings
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search

set bs=2		" Allow backspaceing over everything in insert mode
set autoread		" Read when file is changed from outside automatically
set autowrite		" Automatically save before commands like :next and :make
set mouse=a		" Enable mouse usage (all modes)

set list listchars=tab:\ \ ,trail:·

" Indent settings
set shiftwidth=8	" Intent columns with the reindent operations(<< and >>)
set tabstop=8		" Set columns a tab counts when display
set softtabstop=8	" Set columns a tab counts when hit
set noexpandtab		" No replace tab with space

highlight SpecialKey guifg=LightRed

nnoremap <silent> <F5> :NERDTreeToggle<CR>
