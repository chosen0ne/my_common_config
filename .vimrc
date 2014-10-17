
syntax on
set nocompatible
set nu
set showmatch
set autoindent
set fdm=indent
set backspace=2
"状态栏
set statusline=%F%m%r%h%w\ \ %{fugitive#statusline()}\ \ [FMT=%{&ff}]\ \ [TYPE=%Y]\ \ [POS=%l,%v][%p%%]\ \ \ \ \ %{strftime(\"%Y-%m-%d\ \%H:%M\")}
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
set hlsearch
set laststatus=2
" 增强模式中的命令行自动完成操作
set wildmenu

"filetype
filetype on
filetype plugin indent on
filetype plugin on

"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行
set cursorline
hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

"============================================ Mappings  =============================================================
"Mapping Config
let mapleader = ","

"nore表示不递归
" edit and source .vimrc
nnoremap <leader>ev :split $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>nh :noh<cr>

" mapping for 成对出现
inoremap ()     ()<esc>i
inoremap []     []<esc>i
inoremap {}     {}<esc>i
inoremap ""     ""<esc>i
inoremap ''     ''<esc>i
inoremap <>     <><esc>i

" mapping for common func
nnoremap <leader>q  :q<CR>
nnoremap <leader>aq  :qa<CR>
nnoremap <leader>aw  :wa<CR>
nnoremap <leader>awq  :wqa<CR>
nnoremap <leader>w  :w<CR>

" mapping for win operation
"" make full window
nnoremap <leader>fw     <C-W>_
"" window navigating
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

" advance mapping config
"" [local word]search word at cursor in current file, and emit to quickfix win
nmap <leader>lw :lv /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
"" [key word]search word in current dir and subdir, and emit to quickfix win
nmap <leader>kw :vimgrep /<c-r>=expand("<cword>")<cr>/ **/*<cr>:copen<cr>

"============================================ Builtin =============================================================
"==================================================================================================================
"Quickfix: location list in file which is used to jump between locations in files
"==================================================================================================================
" :lnext    => next location
" :lprev    => previous location
" in the window:
"   o    => to open (same as enter)
"   O    => to open and close quickfix window
"   go   => to preview file (open but maintain focus on ack.vim results)
"   t    => to open in new tab
"   T    => to open in new tab silently
"   h    => to open in horizontal split
"   H    => to open in horizontal split silently
"   v    => to open in vertical split
"   gv   => to open in vertical split silently
"   q    => to close the quickfix window
"==================================================================================================================


"==================================================================================================================
"Tags: jump to tags
"==================================================================================================================
" vim -t main: open and jump to the line which tag 'main' is at
" :ts       => tags list
" :tp       => tags preview
" :tn       => tags next
" <C> + ]   =>
" <C> + T   =>
"==================================================================================================================


"============================================ Plugins =============================================================
"Vundle: plugins management
"==================================================================================================================
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"==================================================================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tomasr/molokai'
Plugin 'hotoo/template.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/vimshell.vim'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"==================================================================================================================
"Pathogen: plugins management
" Activate Pathogen
"execute pathogen#infect()


"==================================================================================================================
"NERDTree: directory tree view
"https://github.com/scrooloose/nerdtree
"==================================================================================================================
" shortcut for NERDTree
nnoremap <leader>n  :NERDTree<cr>
" auto start
autocmd vimenter * NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" exit when only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" filter files
let NERDTreeIgnore=['\.sw[po]$', '\.[ao]$', '\.pyc$']
" sort order of files
let NERDTreeSortOrder=['\/$', '\.rb$', '\.php$', '\.h$', '\.c$', '*', '\.sw.$', '\.bak$', '\~$']


"==================================================================================================================
"NERDCommenter: speed up comment
"https://github.com/scrooloose/nerdcommenter
"==================================================================================================================
"[count]<leader>cc |NERDComComment|         => Comment out the current line or text selected in visual mode.
"[count]<leader>cu |NERDComUncommentLine|   => Uncomments the selected line(s).
"[count]<leader>cn |NERDComNestedComment|   => Same as <leader>cc but forces nesting.
"[count]<leader>c |NERDComToggleComment|    => Toggles the comment state of the selected line(s). 
"[count]<leader>cm |NERDComMinimalComment|  => Comments the given lines using only one set of multipart delimiters.
"[count]<leader>ci |NERDComInvertComment|   => Toggles the comment state of the selected line(s) individually.
"[count]<leader>cs |NERDComSexyComment|     => Comments out the selected lines ``sexily'
"[count]<leader>cy |NERDComYankComment|     => Same as <leader>cc except that the commented line(s) are yanked first.
"<leader>c$ |NERDComEOLComment|             => Comments the current line from the cursor to the end of line.
"<leader>cA |NERDComAppendComment|          => Adds comment delimiters to the end of line and goes into insert mode between them.
"<leader>ca |NERDComAltDelim|               => Switches to the alternative set of delimiters.
"[count]<leader>cl                          => Align delimiters down left side.
"[count]<leader>cb |NERDComAlignedComment|  => Align delimiters down both side.
"==================================================================================================================


"==================================================================================================================
"CtrlP: fuzzy file/buffer search
"https://github.com/kien/ctrlp.vim
"==================================================================================================================
" <C> + v:  vertical split
" <C> + x:  split
" <C> + d:  switch to filename only search instead of full path
" <C> + r:  regex mode
" <C> +
"==================================================================================================================
" find file
noremap <leader>ff  :CtrlP<CR>
" find buffer
noremap <leader>fb  :CtrlPBuffer<CR>
" find MRU
noremap <leader>fm  :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swo,*.swp,*.zip,*.o,*.a,*.pyc     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|gif|jpg|png|pyc|swp|swo|a)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux


"==================================================================================================================
"Syntasitc: syntax check
"https://github.com/scrooloose/syntastic
"==================================================================================================================
" :Errors           => show errors in location list
" :SyntasitcInfo    => show checker info for current file
"==================================================================================================================
" location list always updated
let g:syntastic_always_populate_loc_list = 1
" collect errors when use multple checkers
let g:syntastic_aggregate_errors = 1
let g:syntastic_c_checkers = ['gcc']



"==================================================================================================================
"Gundo: undo tree view
"https://github.com/sjl/gundo.vim
"==================================================================================================================
noremap <leader>gu  :GundoToggle<CR>

let g:gundo_width = 60              " horizontal width of Gundo graph
let g:gundo_preview_height = 40     " vertial height of Gundo preview
let g:gundo_right = 1               " layout right
let g:gundo_preview_bottom = 1      " force the preview window below current windows instead of below the graph

" persistent the undo history
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry


"==================================================================================================================
"Vim_indent_guide: show indent for lines
"https://github.com/nathanaelkane/vim-indent-guides
"==================================================================================================================
" noremap <leader>ig    => open indent window
"==================================================================================================================
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


"==================================================================================================================
"Molokai: color scheme
"https://github.com/tomasr/molokai
"==================================================================================================================
let g:molokai_original = 1
colorscheme molokai


"==================================================================================================================
"Template: code template
" https://github.com/hotoo/template.vim
"==================================================================================================================
" ${cursor} - default cursor position.
" ${filename} - get origin file name.
" ${FileName} - file-name to File-Name.
" ${FILENAME} - filename to FILENAME.
" ${date} - today.
" ${datetime} - now.
" ${author} - Need let g:template_author = "You Name" in your vimrc.
"==================================================================================================================
let g:template_author = "chosen0ne(louzhenlin86@126.com)"


""==================================================================================================================
""Airline: lean and mean status/tabline for vim that's light as air
""
"let g:airline#extensions#tabline#enabled = 1


"==================================================================================================================
"Fugitive: git wrapper
"https://github.com/tpope/vim-fugitive
"==================================================================================================================
" :Gstatus  => git status
" :Gcommit  => git commit
" :Gblame   => git blame
" :Gmove    => git mv
" :Ggrep    => git grep
"==================================================================================================================


"==================================================================================================================
"Surround: quoting/parenthesizing made simple
"https://github.com/tpope/vim-surround
"==================================================================================================================
" cs"'  => change surrounding. " => '
" cst"  => change surrounding to. => "
" ds"   => delete surrounding.
" ysiw] => add surrounding. text object + surrounding
"==================================================================================================================


"==================================================================================================================
"Tagbar: display tags in window, ordered by scope
"https://github.com/majutsushi/tagbar
"==================================================================================================================
let g:tagbar_ctags_bin = "/Users/louzhenlin/dev/app/ctags-5.8/bin/ctags"
nmap <leader>tb :TagbarToggle<CR>
" support golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


"==================================================================================================================
"Ack: lick vimgrep use to find pattern in directory
"==================================================================================================================
" :Ack [options] {pattern} [{directories}]  
"   => Search recursively in {directory} (which defaults to the current directory) for the {pattern}
"==================================================================================================================


"==================================================================================================================
"EasyMotion: speed up vim motion
"https://github.com/Lokaltog/vim-easymotion
"==================================================================================================================
" <leader><leader>w => <Plug>(easymotion-w)     => move by word
"==================================================================================================================
map <leader> <Plug>(easymotion-prefix)
"" search one char 
nmap s <Plug>(easymotion-s)
" search two char
nmap ds <Plug>(easymotion-s2)
nnoremap <leader>sw <Plug>(easymotion-w)
" search N chars
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
" search in cur line
nnoremap <leader>ls <Plug>(easymotion-sl)
" search in cur line to both direction
nnoremap <leader>lw <Plug>(easymotion-bd-wl)
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0    " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1      " similarly to Vim's smartcase option for global searches
let g:EasyMotion_do_mapping = 0     " Disable default mappings


"==================================================================================================================
"Tabular: text filtering and aligning
"https://github.com/godlygeek/tabular
"==================================================================================================================
if exists(":Tabularize")
    " align by =
    nmap <leader>a= :Tabularize /=<CR>
    vmap <leader>a= :Tabularize /=<CR>
    " align by :
    nmap <leader>a: :Tabularize /:\zs<CR>
    vmap <leader>a: :Tabularize /:\zs<CR>
endif


"==================================================================================================================
"Repeat: enable repeating supported plugin maps "."
"https://github.com/tpope/vim-repeat
"==================================================================================================================
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)


"==================================================================================================================
"Gitgutter: show git diff in the gutter, and stage/reverts hunks
"https://github.com/airblade/vim-gitgutter
"==================================================================================================================
" <leader>hs    => stage the hunk
" <leader>hr    => revert the hunk
"==================================================================================================================
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
nnoremap <leader>gt :GitGutterToggle<CR>
nnoremap <leader>gst :GitGutterSignsToggle<CR>


"==================================================================================================================
"Unimpaired: pairs of handy bracket mappings
"https://github.com/tpope/vim-unimpaired
"==================================================================================================================
"
"


"==================================================================================================================
"Vimshell: shell in vim
"https://github.com/Shougo/vimshell.vim
"==================================================================================================================
"vimshell read ~/.vimshrc as init file
" :VimShell     => open shell
nnoremap <leader>sh :VimShellPop<CR>
nnoremap <leader>sht :VimShellTab<CR>


"==================================================================================================================
"DirDiff: diff and merge two directories recursively
"https://github.com/vim-scripts/DirDiff.vim
"==================================================================================================================
" :DirDiff <A:Src Dir> <B:Src Dir>
" commands in diff window:
"   o/Enter     => open diff file
"   s           => sync current diff
"   u           => update diff window
"
"==================================================================================================================
let g:DirDiffExcludes = "*.swp,*.swo*.class,*.pyc,*.a,*.o"


"==================================================================================================================
"YouCompleteMe: a code-completion engine
"https://github.com/Valloric/YouCompleteMe
"==================================================================================================================
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_always_populate_loc_list = 1
" invoke prompt of completion
let g:ycm_key_invoke_completion = '<C-U>'


