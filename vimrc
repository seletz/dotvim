"-----------------------------------------------------------------------------
" seletz' vim config
" 2011-02-19
set nocompatible

" Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" colors
syntax enable
if has("gui_macvim")
  set background=light
  colorscheme solarized
  let g:solarized_visibility="high"    "default value is normal
else
  colorscheme desert
endif
"colorscheme desert

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

set autochdir

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
  set laststatus=2            " needed for vim-powerline
  " I use vim-powerline now: https://github.com/Lokaltog/vim-powerline.git"
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
"

"macm Window.Select\ Next\ Tab			key=<D-Left>
"macm Window.Select\ Previous\ Tab	key=<D-Left>
nmap <S-F1> <esc> :NERDTreeToggle<CR>

" saussage fingers
nmap <F1> <esc> 

nmap <F2> <esc>:w<cr>
nmap <S-F2> :make<CR>
nmap <F4> <esc>:q<cr>

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
autocmd FileType coffee abbr kmod <esc>:r ~/.vim/skeletons/skeleton.coffee<cr>

" VIM footers
autocmd FileType css abbr kvim /* vim: set ft=css ts=4 sw=4 expandtab : */
autocmd FileType rst abbr kvim :: <CR> vim: set ft=rst ts=4 sw=4 expandtab tw=78 :
autocmd FileType python abbr kvim # vim: set ft=python ts=4 sw=4 expandtab :
autocmd FileType xml abbr kvim <!-- vim: set ft=xml ts=4 sw=4 expandtab : -->
autocmd FileType html abbr kvim <!-- vim: set ft=html ts=2 sw=2 expandtab : -->
autocmd FileType changelog abbr kvim vim: set ft=changelog ts=4 sw=4 expandtab :

" Closetag Plugin 
autocmd FileType html let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,pt,zcml source ~/.vim/bundle/closetag/plugin/closetag.vim

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

"-----------------------------------------------------------------------------
" Coffee Script
autocmd FileType coffee nnoremap <silent> <f5> :CoffeeCompile vertical<cr>
autocmd FileType coffee vnoremap <silent> <f5> :CoffeeCompile<cr>

" vim: set ts=2 sw=2 expandtab:

