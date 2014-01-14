" Tip:
"     If you find anything that you can't understand then do this:
"     help keyword OR helpgrep keywords
" Example:
"     Go into command-line mode and type helpgrep nocompatible, ie.
"     :helpgrep nocompatible
"     then press <leader>c to see the result, or :botright cw
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get out of VI's compatible mode
set nocompatible

" Sets how many lines of history VIM har to remember
set history=400

" Set to auto read when a file is changed from the outside
set autoread

" Always show current position
set ruler

" Show line number
set nu

" Ignore case when searching
set ignorecase
set incsearch

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=

" Show matching bracets
set showmatch

" Highlight search things
set hlsearch

" Turn backup off
set nobackup
set nowb
set noswapfile

" Enable folding, I find it very useful
set nofen
set fdl=0

"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" incremental search
set incsearch

" Session options
set sessionoptions-=curdir
set sessionoptions+=sesdir

set whichwrap=b,s,<,>,[,]
set backspace=indent,eol,start

"Wrap lines
set wrap
set linebreak
set nolist

" Always show status
set laststatus=2

" Hightlight column 80
set colorcolumn=80
highlight colorcolumn ctermbg=0
" Folding
set foldenable
set foldmethod=syntax

" Display extra whitespace
set list 
set listchars=tab:>>,trail:.
highlight NonText ctermfg=0 guifg=gray

augroup vimrcEx
  autocmd!

  " For all text files set textwidth to 80 chars
  autocmd FileType text setlocal textwidth=80

  " When editing a file always jump to the last known cursor position
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "norm `\"" |
    \ endif
augroup END

" Set mapleader
let mapleader = ","
let g:mapleader = ","

let g:syntastic_check_on_open=1

nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>nh :noh<cr>
nmap <leader>nn :set nonumber<cr>
nmap <leader>ni :set nosmartindent nocindent noautoindent
nmap <leader>ss :source ~/.vimrc<cr>
nmap <leader>ee :e ~/.vimrc<cr>

" nnoremap <leader> <leader> <c-^>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Enable syntax highlight
syntax enable

" Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>te :tanedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Switch to current dir
map <leader>cd :cd %:p:h<cr>

" Quickfix
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>

" Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

" Works when foldmethod=manual
vnoremap <Space> zf
nnoremap <leader>k zR

set foldmethod=syntax
let javaScript_fold=1
let sh_fold_enabled=1
let xml_syntax_folding=1
let perl_fold=1

" Switch to buffers
nnoremap <leader>l: ls<CR>
nnoremap <leader>b: bp<CR>
nnoremap <leader>f: bn<CR>
nnoremap <leader>g: e#<CR>
nnoremap <leader>1: 1b<CR>
nnoremap <leader>2: 2b<CR>
nnoremap <leader>3: 3b<CR>
nnoremap <leader>4: 4b<CR>
nnoremap <leader>5: 5b<CR>
nnoremap <leader>6: 6b<CR>
nnoremap <leader>7: 7b<CR>
nnoremap <leader>8: 8b<CR>
nnoremap <leader>9: 9b<CR>
nnoremap <leader>0: 10b<CR>

"""""""""""Plugins""""""""""

""""""""""""""""""""""""""""""
" Vim Grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git'
let Grep_Cygwin_Find = 1

"""""""""""""""""""""""""""""""""""
" Minibuffer
"""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplHSplit = 25
let g:miniBufExplSplitBelow=0
let g:bufExplorerSortBy = "name"

" c++11
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.cxx set syntax=cpp11

" Bundle
filetype off   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

execute pathogen#infect()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/ListToggle'
Bundle 'Valloric/YouCompleteMe'
Bundle 't9md/vim-quickhl'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-pathogen'
Bundle 'christoomey/vim-tmux-navigator'
 
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................

filetype plugin indent on

" YCM
nnoremap <leader>gd: YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" CTRLP
" ctrl + c or g -- close ctrp
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

" EasyGrep

" clang formatting
map <leader>f :pyf ~/work/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
imap <A-K> <ESC> :pyf ~/work/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i

" Lastly, local config
if filereadable($HOME . "/.vimrc.local")
    source ~/.vimrc.local
endif

