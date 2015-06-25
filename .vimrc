set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'klen/python-mode'
Plugin 'flazz/vim-colorschemes'

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

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set t_Co=256
colorscheme Tomorrow-Night-Eighties
syntax on

set mouse=a

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set nowrap
set ruler
set backspace=2

" Execute File
map <F5> :!%:p
" Generate Markdown html file
map <F6> :!viewmarkdown %:p
" Activate spell check
map <F4> :set spell spelllang=en_us
" Deactivate spell check
map <F3> :set nospell

" The following maps the F8 key to toggle between hex and binary (while also
" setting the noeol and binary flags, so if you :write your file, vim doesn't perform
" unwanted conversions.

noremap <F8> :call HexMe()<CR>

let $in_hex=0
function HexMe()
set binary
set noeol
if $in_hex>0
:%!xxd -r
let $in_hex=0
else
:%!xxd
let $in_hex=1
endif
endfunction

cmap w!! w !sudo tee > /dev/null %
set clipboard+=unnamed

"Pymode settings
let g:pymode_lint_ignore = "E501"
