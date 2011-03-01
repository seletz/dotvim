"-----------------------------------------------------------------------------
" seletz' vim config
" 2011-02-19
set nocompatible

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" colors
colorscheme desert

"-----------------------------------------------------------------------------
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

" omnicomplete
set wildmode=longest,list

let mapleader=","

if has('cmdline_info')
   set ruler                   " show the ruler
   set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
   set showcmd                 " show partial commands in status line and
                               " selected characters/lines in visual mode
endif

if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
  set fuoptions=maxvert,maxhorz
endif


if has('statusline')
  set laststatus=1            " show statusline only if there are > 1 windows
  " Use the commented line if fugitive isn't installed
  "set statusline=%&lt;%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
  set statusline=%<;%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
endif

if has('gui_running')
  set guioptions-=T
  set guioptions-=m
  set guioptions-=L
  set guioptions-=r
  set guifont=Menlo:h14
endif

"-----------------------------------------------------------------------------
" backup, swap, views
set backup                      " backups are nice ...
set backupdir=$HOME/.vimbackup//  " but not when they clog .
set directory=$HOME/.vimswap//  " Same for swap files
set viewdir=$HOME/.vimviews//   " same for view files

"" Creating directories if they don't exist
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'
au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)

"-----------------------------------------------------------------------------
" Plugin configuration

" Supertab
" let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"

" NerdTREE
let g:NERDTreeMapActivateNode=""

" PeepOpen
nmap <leader>t :PeepOpen<CR>

" EasyGrep
let g:EasyGrepRecursive=1

"-----------------------------------------------------------------------------
" mappings

nmap <F1> :NERDTreeToggle<cr>
nmap <F2> <esc>:w<cr>
nmap <S-F2> :make<CR>
nmap <F4> <esc>:bdel<cr>

nmap <C-up> <C-W>k
nmap <C-down> <C-W>j 
nmap <C-left> <C-W>h 
nmap <C-right> <C-W>l 

map <silent> <D-S-Right> :macaction selectNextWindow:<CR>
map <silent> <D-S-Left> :macaction selectPreviousWindow:<CR>

"-----------------------------------------------------------------------------
" abbreviations

" templates
autocmd FileType python abbr kmod <esc>:r ~/.vim/skeletons/skeleton.py<cr>
autocmd FileType rst abbr kmod <esc>:r ~/.vim/skeletons/skeleton.rst<cr>
autocmd FileType zpt abbr kmod <esc>:r ~/.vim/skeletons/skeleton.pt<cr>

" VIM footers
autocmd FileType css abbr kvim /* vim: set ft=css ts=4 sw=4 expandtab : */
autocmd FileType rst abbr kvim :: <CR> vim: set ft=rst ts=4 sw=4 expandtab tw=78 :
autocmd FileType python abbr kvim # vim: set ft=python ts=4 sw=4 expandtab :
autocmd FileType xml abbr kvim <!-- vim: set ft=xml ts=4 sw=4 expandtab : -->
autocmd FileType html abbr kvim <!-- vim: set ft=html ts=2 sw=2 expandtab : -->
autocmd FileType changelog abbr kvim vim: set ft=changelog ts=4 sw=4 expandtab :

"-----------------------------------------------------------------------------
" Python Settings
autocmd FileType python set ts=4 sw=4 expandtab nocin nosi ai
autocmd FileType python compiler pyunit
" autocmd FileType python set makeprg=~/bin/ptest
" autocmd FileType python nmap K :call ShowPyDoc('<C-R><C-W>', 1)<CR>
" autocmd FileType python source ~/.vim/python/python.vim
autocmd FileType python abbr kpdb import pdb; pdb.set_trace()
autocmd FileType python abbr kipdb import ipdb; ipdb.set_trace()
autocmd FileType python abbr kvpdb import vimpdb; vimpdb.set_trace()

" vim: set ts=2 sw=2 expandtab:

