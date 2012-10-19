"-----------------------------------------------------------------------------
" seletz' vim config
" 2011-02-19
set nocompatible

" Pathogen
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'benmills/vimux'
Bundle 'docunext/closetag.vim'
Bundle 'gmccreight/vim-easygrep'
Bundle 'gregsexton/gitv'
Bundle 'hallettj/jslint.vim'
Bundle 'jpalardy/vim-slime'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'msanders/cocoa.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-align'
Bundle 'tsaleh/vim-supertab'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'xolox/vim-session'



"-----------------------------------------------------------------------------
" colors
syntax enable
if has("gui_macvim")
  set background=dark
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
set cursorline

" indent folding, but limit to one level
" set foldmethod=indent
" set foldnestmax=1
" nmap <C-CR> za

" list trailing chars, but no eol
set listchars+=trail:#
set listchars-=eol:$
set list
autocmd FileType c,cpp,python,ruby,java,coffee,rst autocmd BufWritePre <buffer> :%s/\s\+$//e

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

map <silent> <M-D-Right> :macaction selectNextWindow:<CR>
map <silent> <M-D-Left> :macaction selectPreviousWindow:<CR>

nmap <C-S> :split<cr>
nmap <C-V> :vsplit<cr>

nnoremap <cr> :nohlsearch<cr><cr>


"-----------------------------------------------------------------------------
" easysession stuff

"" Vim Session https://github.com/xolox/vim-session
let g:session_autosave = 1
let g:session_autoload = 1
let g:session_command_aliases = 1
" Don't persist options and mappings because it can corrupt sessions.
set sessionoptions-=options
" Always persist Vim's window size.
set sessionoptions+=resize
set sessionoptions-=help " no help windows restored please
" set sessionoptions-=tabpages " no tabs
" Persist the value of the global option 'tags'.
let g:session_persist_globals = ['&tags']

"-----------------------------------------------------------------------------
" abbreviations

" templates
autocmd FileType python abbr kmod <esc>:r ~/.vim/skeletons/skeleton.py<cr>
autocmd FileType rst abbr kmod <esc>:r ~/.vim/skeletons/skeleton.rst<cr>
autocmd FileType zpt abbr kmod <esc>:r ~/.vim/skeletons/skeleton.pt<cr>
autocmd FileType coffee abbr kmod <esc>:r ~/.vim/skeletons/skeleton.coffee<cr>
autocmd FileType c abbr kmod <esc>:r ~/.vim/skeletons/skeleton.c<cr>

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
" syntastic settings

" ignore too long lines and multiple WS before op warnings.
let g:syntastic_python_checker_args = '--ignore=E501,E221,E241'
let g:systastic_auto_jump=1
let g:syntastic_auto_loc_list=1

"-----------------------------------------------------------------------------
" gitv plugin https://github.com/gregsexton/gitv

let g:Gitv_OpenHorizontal = 1
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

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
autocmd FileType coffee set ts=4 sw=4 expandtab nocin nosi ai
autocmd FileType coffee nnoremap <silent> <f5> :CoffeeCompile vertical<cr>
autocmd FileType coffee vnoremap <silent> <f5> :CoffeeCompile<cr>

"-----------------------------------------------------------------------------
" C Settings
autocmd FileType c syn match cDefine display "_DBG.*(.*);"
autocmd FileType c set ts=2 sw=2 si ai cin expandtab nolist tw=78

" vim: set ts=2 sw=2 expandtab:

