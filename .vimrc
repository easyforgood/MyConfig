source $HOME/.vim/plug.vim

" color theme
le g:molokai_original = 1
let g:rehash256 = 1
" colorscheme molokai
colorscheme gruvbox
set background=dark
" set background=light
let g:gruvbox_contrast_light="hard"
" font 
set guifont=mononoki\ 10

syntax on
set tabstop=4
set number
set showmatch
set softtabstop=4
set fileencoding=utf-8
set autoindent
set softtabstop=0 noexpandtab
set shiftwidth=4
set encoding=utf-8
set cuc
set cul
set tags+=tags
set autochdir
set nocompatible
set t_Co=256
" }}}-------------------------------------------------------------------------
" "   Visual
" {{{
" "
" ----------------------------------------------------------------------------
"
"  " Control Area (May be superseded by vim-airline)
set wildmenu                " Command completion
set wildmode=list:longest   " List all matches and complete till longestcommon string
set laststatus=2            " The last window will have a status linealways
set noshowmode              " Don't show the mode in the last line of thescreen, vim-airline takes care of it
set ruler                   " Show the line and column number of the cursorposition, separated by a comma.
set lazyredraw  
set showcmd 



set hlsearch 
set mouse=a 
 
"" code fold
set foldmethod=indent
set foldlevel=99
set term=screen-256color
" show fold column, fold by markers
set foldcolumn=0            " Don't show the folding gutter/column
set foldmethod=marker       " Fold on {{{ }}}
set foldlevelstart=20       " Open 20 levels of folding when I open a file

" Open folds under the following conditions
set foldopen=block,hor,mark,percent,quickfix,search,tag,undo,jump


set listchars=tab:▸\ ,trail:•
set list                    " Make whitespace characters visible


" Splits
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right"

syntax on

syntax enable
filetype plugin indent on

let g:minBufExplForceSyntaxEnable = 1
let g:python_highlight_all=1
"""" you complete me
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python2.7'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '<CR>'     
""上下左右键行为"
"inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
"inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'

""F2开启和关闭树"
"map <F2> :NERDTreeToggle<CR>
"let NERDTreeChDirMode=1
"""显示书签"
"let NERDTreeShowBookmarks=1
""设置忽略文件类型"
"let NERDTreeIgnore=['~$', '.pyc$', '.swp$']
"""窗口大小"
"let NERDTreeWinSize=25
			
let NERDTreeWinPos='right'
"autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
aug QFClose
	  au!
	  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif 
	
aug END
map <F2> :NERDTreeToggle<CR>
"map <F3> :ConqueTermVSplit zsh<CR>
set mouse=n
let g:ctrlp_map = '<c-p>'

"""" async run 


" Quick run via <F10>
nnoremap <F10> :call <SID>compile_and_run()<CR>
noremap <F9> :ccl <CR> 

augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
	elseif &filetype == 'go'
       exec "AsyncRun! time go run %"
    endif
endfunction

"autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
"autocmd FileType python nnoremap <LocalLeader>= :call yapf#YAPF()<CR>

let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fixers = { 'python': ['yapf'] }



function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

""" airline
" let g:airline_theme="luna"
let g:airline_theme="gruvbox"

"这个是安装字体后 必须设置此项"
let g:airline_powerline_fonts = 1

"打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
"我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" my map
vnoremap <C-Y> "+y



function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose
        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

		
let mapleader = "\\"
map <Leader> <Plug>(easymotion-prefix)
map <Leader>. <Plug>(easymotion-repeat)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)
nmap s <Plug>(easymotion-s)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)



nmap <Leader>s  :w<CR> 
imap <Leader><Leader>s  <ESC>:w<CR>a
nmap <Leader>x  :wq<CR> 
" map <F3> :w<CR>

" imap <F3> <ESC>:w<CR>
map <Leader><leader>q :q!<CR>
map  <leader>q :q <CR>
map  <leader>z :wq <CR>
map  <leader>w :w <CR>
map  <F8> :shell <CR>
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

set splitbelow
set splitright

" mac backspace
set backspace=indent,eol,start
" python tab
"au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix
"" front-end tab wtf !
"au BufNewFile,BufRead *.js, *.html, *.css, *.vue
"    \ set tabstop=2
"    \ set softtabstop=2
"    \ set shiftwidth=2

map <Leader>1  :buffer 1<CR> 
map <Leader>3  :buffer 3<CR> 
map <Leader>5  :buffer 5<CR> 
map <Leader>2  :buffer 2<CR> 
map <Leader>4  :buffer 4<CR> 
map <Leader>6  :buffer 6<CR> 
set nobomb
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>
" system clipcopy board
"
set clipboard=unnamed
" let g:completor_gocode_binary = '/Users/<TBD>/Workplace/go/bin/gocode'
let g:multi_cursor_start_key='<C-m>'
map <C-h> <C-w>h
map <C-l> <C-w>l
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
imap <F3> <ESC>:w<return>
nmap <F3> :w<return>

filetype plugin on
autocmd FileType go inoremap <C-n> <C-x><C-o>

" golang auto import
let g:go_fmt_command = "goimports"

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack 

" for ack plugin log leak to shell
set shellpipe=>
