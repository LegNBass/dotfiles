set nocompatible              " be iMproved, required
filetype off                  " required

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing vundle"
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/Vundle.vim'
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'Valloric/YouCompleteMe'
Bundle 'hynek/vim-python-pep8-indent'
if iCanHazVundle == 0
    echo "Installing Bundles..."
    echo ""
    :BundleInstall
endif

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
let g:pymode_lint_ignore = "E501,E731"
let g:pymode_python = "python3"

filetype plugin indent on
