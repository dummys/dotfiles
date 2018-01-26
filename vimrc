
" grabbed from: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" dont forget to install vim-youcompleteme-git from aur-repo

" Start of Vundle configuration

set shell=/bin/bash " required for fish shell
set nocompatible " required 
syntax on " required
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim/


call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add plugins here

" folding of functions
Plugin 'tmhedberg/SimpylFold'

" source: https://github.com/pearofducks/ansible-vim
Plugin 'pearofducks/ansible-vim' " yaml synthax and indent

" for auto indentation fix
Plugin 'vim-scripts/indentpython.vim'

" Check synthax after close TODO test
Plugin 'vim-syntastic/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" ColorScheme
Plugin 'joedicastro/vim-molokai256'


" Proper tree for file browsing
Plugin 'scrooloose/nerdtree'

" Git integration
Plugin 'tpope/vim-fugitive'


call vundle#end()         " required
filetype plugin indent on " required

"End of Vundle Configuration

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent

"Set all fold using F2
nnoremap <expr> <f2> &foldlevel ? 'zM' :'zR'

"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

" Show docstring in folding code
let g:SimpylFold_docstring_preview=1


" auto completion for python
" required by package vim.youcompleteme from Arch 
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Made Vim aware of Venv
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Hide .pyc file in newrdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set encoding=utf-8

" js html and so on
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" yaml indentation for ansible
" already done
" yaml indent for *.yml
au BufRead,BufNewFile *.yml set filetype=ansible


" Set colorScheme base on VIM mode
colorscheme molokai256

" Share the clipboard with system
set clipboard=unnamed
