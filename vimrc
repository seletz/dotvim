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
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'docunext/closetag.vim'
Bundle 'gregsexton/gitv'
Bundle 'hallettj/jslint.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'msanders/cocoa.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-align'
Bundle 'tsaleh/vim-supertab'
Bundle 'vim-scripts/The-NERD-Commenter'
Bundle 'vim-scripts/pythoncomplete'
Bundle 'xolox/vim-session'
Bundle 'olethanh/Vim-nosecompiler'
Bundle 'reinh/vim-makegreen'
Bundle 'xolox/vim-misc'
Bundle 'elixir-lang/vim-elixir'
Bundle 'Rykka/riv.vim'

" unite
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'

" colours ....
Bundle 'chriskempson/base16-vim'

"-----------------------------------------------------------------------------
" colors
syntax enable
if has("gui_macvim")
  set background=dark
  " colorscheme solarized
  colorscheme base16-solarized
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

set autochdir

" omnicomplete
set wildmode=longest,list

let mapleader=","
let maplocalleader="_"

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
  set guifont=Monaco\ for\ Powerline:h14
endif

"-----------------------------------------------------------------------------
" backup, swap, views
" set backup                      " backups are nice ...
" set backupdir=$HOME/.vimbackup//  " but not when they clog .
set directory=$HOME/.vimswap//  " Same for swap files
set viewdir=$HOME/.vimviews//   " same for view files

" sauna.reload
set noswapfile
set nobackup
set nowritebackup

set viewoptions-=options
set sessionoptions-=options

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

" Sessions
let g:session_autosave = 'no'
let g:session_autoload = 'no'

" PeepOpen
nmap <leader>t :PeepOpen<CR>

" EasyGrep
let g:EasyGrepRecursive=1

" Powerline
let g:Powerline_symbols = 'fancy'

" jedi
"let g:jedi#auto_initialization = 0
"let g:jedi#popup_on_dot = 0

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
let g:unite_enable_start_insert = 1
let g:unite_update_time = 200
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''

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

nnoremap <cr> :nohlsearch<cr><cr>

" Align = visual
vmap <C-CR> :Align =<CR>
nmap <leader>rs <esc>:%s/\s\+$//e<cr>

" Unite mappings
" https://github.com/terryma/dotfiles/blob/08205cf62553213b5f0893735529de3fe5dd3f01/.vimrc
"
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]

" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
      \ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers buffer file_mru<CR>

" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>

" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>

" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>

" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d
      \ :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>

" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>

" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
      " \ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>

" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history history/command command<CR>


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

" org-mode
autocmd FileType rst abbr kmeeting <esc>:r ~/Dropbox/daily_notes/template-meeting.rst<cr>
autocmd FileType rst abbr ktodo <esc>:r ~/Dropbox/daily_notes/template-meeting.rst<cr>

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

autocmd BufNewFile,BufRead test_*.py compiler nose

"-----------------------------------------------------------------------------
" syntastic settings

let g:syntastic_python_checkers = ['pep8', 'pylint']
let g:syntastic_python_pep8_post_args='--ignore=E501,E302,E123,E203,E241,E221'
let g:systastic_auto_jump=0
let g:syntastic_auto_loc_list=1
let g:syntastic_quiet_warnings=1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'


"-----------------------------------------------------------------------------
" gitv plugin https://github.com/gregsexton/gitv

let g:Gitv_OpenHorizontal = 1
nmap <leader>gs :Gstatus<cr>
nmap <leader>ga :Git add %<cr>
nmap <leader>gd :Gdiff<cr>
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

"-----------------------------------------------------------------------------
" Clojure Settings
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let vimclojure#WantNailgun = 1


" vim: set ts=2 sw=2 expandtab:

