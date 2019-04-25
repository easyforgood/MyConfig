" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
" Plug 'captbaritone/molokai'
" Plug 'altercation/vim-colors-solarized'
Plug 'ajh17/spacegray.vim'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
" Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
" Plug 'qrps/lilypond-vim', { 'for': 'lilypond' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
" Plug 'mxw/vim-jsx'
" Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/nerdcommenter'

" Completion
Plug 'mattn/emmet-vim', { 'for': [ 'html','wxml','xml' ]}

" Make % match xml tags
Plug 'https://github.com/adelarsq/vim-matchit', { 'for': ['html', 'xml', 'html'] }

" Make tab handle all completions
Plug 'ervandew/supertab'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fancy statusline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file opener

" Open from quick-fix-list in new split
Plug 'yssl/QFEnter'

" Respect .editorconfig files. (http://editorconfig.org/)
Plug 'editorconfig/editorconfig-vim'

" Search files using Silver Searcher
" Plug 'rking/ag.vim'

" Make Ag searches of selected text
" Plug 'Chun-Yang/vim-action-ag'

" Rename/remove files from within vim
" Plug 'tpope/vim-eunuch'

" Make commenting easier
Plug 'tpope/vim-commentary'

" CamelCase motions through words
Plug 'bkad/CamelCaseMotion'

" Split and join lines of code intelligently
Plug 'AndrewRadev/splitjoin.vim'

" Only show cursorline in the current window
Plug 'vim-scripts/CursorLineCurrentWindow'

" Split navigation that works with tmux
Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'

" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'

" Custom motions

" Indent object
Plug 'michaeljsmith/vim-indent-object'
" Camel Case object
Plug 'bkad/CamelCaseMotion'
"
" Argument object
" Plug 'vim-scripts/argtextobj.vim'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" Show git status in the gutter
" Plug 'airblade/vim-gitgutter'

" Python completion and tag navigation
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }

" Wrap and upwrap argument lists
Plug 'FooSoft/vim-argwrap'

" Take notes and keep todo lists in vim
" Plug 'vimwiki/vimwiki'

" 'Vastly improved Javascript indentation and syntax support in Vim'
Plug 'pangloss/vim-javascript'

" Visualize undo tree
" Plug 'mbbill/undotree'


if has('nvim')
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'not':'python' }
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
else
	Plug 'Shougo/deoplete.nvim' ", {'not': 'python'}
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'Raimondi/delimitMate'
" multiplecursors
Plug 'terryma/vim-multiple-cursors'
Plug 'docunext/closetag.vim', { 'for': ['html','wxml', 'xml'] }
"Plug 'fs111/pydoc.vim'
Plug 'posva/vim-vue'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
" Plug 'maralla/completor.vim'  ", { 'not': 'go' }
Plug 'easymotion/vim-easymotion'
" Plug 'jmcantrell/vim-virtualenv'
Plug 'google/yapf', { 'rtp': 'plugins/vim','for':['python'] }
Plug 'benmills/vimux'
Plug 'skywind3000/asyncrun.vim'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'lrvick/Conque-Shell'
"Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'tmhedberg/SimpylFold' 
Plug 'morhetz/gruvbox'
" Plug 'majutsushi/tagbar'
" Plug 'chemzqm/wxapp.vim'
" Plug 'tomlion/vim-solidity'
Plug 'mileszs/ack.vim'



" Other plugins require curl
if executable("curl")

    " Webapi: Dependency of Gist-vim
    Plug 'mattn/webapi-vim'

    " Gist: Post text to gist.github
    Plug 'mattn/gist-vim'
endif

filetype plugin indent on                   " required!
call plug#end()

