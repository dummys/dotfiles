
" grabbed from: https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/

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

" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'

" Proper tree for file browsing
Plugin 'scrooloose/nerdtree'

" Git integration
Plugin 'tpope/vim-fugitive'


call vundle#end()         " required
filetype plugin indent on " required

"End of Vundle Configuration

"Folding Options

" Enable folding
autocmd FileType python set foldmethod=indent

" Enable folding with the spacebar
nnoremap <space> za

" Show docstring in folding code
let g:SimpylFold_docstring_preview=1


" auto completion for python
" required by package vim.youcompleteme from Arch 
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" python pep8 stuff
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Make python code looks pretty
let python_highlight_all=1
syntax on

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

" flag whitespace in red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h
    \ match BadWhitespace /\s\+$/


" js html and so on

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" yaml indentation
" autodetected

" Set colorScheme base on VIM mode
colorscheme molokai256

" Share the clipboard with system
set clipboard=unnamed


