set nocompatible

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" colors
colorscheme desert

" basic stuff
filetype plugin indent on
syntax on
set vb
set nowrap
set number
set hlsearch
set incsearch
set smartcase
set showmatch
set foldenable
set autoindent

let mapleader=","

if has('cmdline_info')
   set ruler                   " show the ruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
   set showcmd                 " show partial commands in status line and
                               " selected characters/lines in visual mode
endif

if has('statusline')
  set laststatus=1            " show statusline only if there are > 1 windows
  " Use the commented line if fugitive isn't installed
  "set statusline=%&lt;%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
  set statusline=%<;%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

if has('guirunning')
  set guioptions=-T
endif

" mappings

nmap <F2> <esc>:w<cr>
nmap <F4> <esc>:bdel<cr>

nmap <C-up> <C-W>k
nmap <C-down> <C-W>j 
nmap <C-left> <C-W>h 
nmap <C-right> <C-W>l 

" vim: set ts=2 sw=2 expandtab:

