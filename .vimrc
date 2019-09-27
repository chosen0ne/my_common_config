set nocompatible
filetype off

"============================================ Plugins Manager =====================================================
"Vundle: plugins management -----{{{
"==================================================================================================================
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"==================================================================================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
call vundle#begin()

" let Vundle manage plugins, required
Plugin 'gmarik/Vundle.vim'

" other plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'hotoo/template.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'Shougo/vimshell.vim'
Plugin 'vim-scripts/DirDiff.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'klen/python-mode'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'plasticboy/vim-markdown'
Plugin 'elzr/vim-json'
Plugin 'vim-textobj-user'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'rust-lang/rust.vim'
"" search Dash.app from vim
Plugin 'rizzatti/dash.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'svermeulen/vim-subversive'
Plugin 'tpope/vim-abolish'
"" code completion use depp learning
"Plugin 'zxqfl/tabnine-vim'

"" colorscheme
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'

"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
" All of your Plugins must be added before the following line
call vundle#end()
"============================================== END ===============================================================
" }}}


syntax on
set nu
set showmatch
set autoindent
set fdm=indent
set backspace=2
" status line
"set statusline=%F%m%r%h%w\ \ %{fugitive#statusline()}\ \ [FMT=%{&ff}]\ \ [TYPE=%Y]\ \ [POS=%l,%v][%p%%]\ \ \ \ \ %{strftime(\"%Y-%m-%d\ \%H:%M\")}

" <tab> => n spaces
set tabstop=4
" indent => n spaces
set shiftwidth=4
set softtabstop=4
set expandtab
set incsearch
set hlsearch
set laststatus=2
set wildmenu
set updatetime=100
set hidden

" filetype
filetype on
filetype plugin indent on
filetype plugin on

autocmd InsertLeave * se cursorline  " 用浅色高亮当前行
"autocmd InsertEnter * se cul    " 用浅色高亮当前行
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white


"============================================ Mappings  =============================================================
" Mapping Config
let mapleader = ","

" nore => no recursive
" edit and source .vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" common case
nnoremap <leader>nh :noh<cr>
inoremap jk <esc>
" enable it will make arrows to '<up> -> OA', '<down> -> OB', '<left> -> OC', '<right> -> OD'
"inoremap <esc> <nop>

" mapping for matched operators
inoremap ()     ()<esc>i
inoremap []     []<esc>i
inoremap {}     {}<esc>i
inoremap ""     ""<esc>i
inoremap ''     ''<esc>i
inoremap <>     <><esc>i

" operation in INSERT MODE
"" remove current line
inoremap <leader>dl     <esc>ddko
"" remove current word
inoremap <leader>dw     <esc>viwdi
"" remove contents in matched operators
inoremap <leader>d{     <esc>vi}di
inoremap <leader>d}     <esc>vi}di
inoremap <leader>d(     <esc>vi(di
inoremap <leader>d)     <esc>vi(di
inoremap <leader>d[     <esc>vi[di
inoremap <leader>d]     <esc>vi[di
inoremap <leader>d<     <esc>vi<di
inoremap <leader>d>     <esc>vi<di
inoremap <leader>d'     <esc>vi'di
inoremap <leader>d"     <esc>vi"di
"" switch between uppercase and lowercase for current word
inoremap <leader>uw     <esc><right>viw~i

"" ()  ->
"" (
""     <pointer>
"" )
inoremap <leader>()     ()<left><Enter><Enter><up><tab>
"" {}  ->
"" {
""      <pointer>
"" }
inoremap <leader>{}     {}<left><Enter><Enter><up><tab>

" operation in NORMAL MODE
"" switch between uppercase and lowercase for current word
nnoremap <leader>uw     viw~

" mapping for common func
nnoremap <leader>q      :q<cr>
nnoremap <leader>qa     :qa<cr>
nnoremap <leader>qw     :wq<cr>

" mapping for win operation
"" make full window
nnoremap <leader>fw     <C-W>_
"" window navigating
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l
"" scroll window down 20 lines, cursor is fixed
noremap <leader>we 20<C-E>
"" scroll window up 20 lines, cursor is fixed
noremap <leader>wy 20<C-Y>

" advance mapping config
"" [local word]search word at cursor in current file, and emit to quickfix win
nmap <leader>lw :lvimgrep /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
"" [key word]search word in current dir and subdir, and emit to quickfix win
nmap <leader>kw :vimgrep /<c-r>=expand("<cword>")<cr>/ **/*<cr>:copen<cr><c-w>J

" mapping for programming
"" 'My Mark' and 'My Why' for c or c++
nnoremap <leader>mm o//<space><MM><esc>o</MM><esc>ko
nnoremap <leader>mw o//<space><MW><esc>o</MW><esc>ko
" python debug
nnoremap <leader>pd oimport pdb; pdb.set_trace()<esc>:w<cr>
inoremap <leader>pd <esc>koimport pdb; pdb.set_trace()<esc>:w<cr>

" movement mapping, like: w, etc.
"" select content in the next ()
"onoremap <leader>qn :<c-u>normal! f(vi(<cr>
"" select content in the last ()
"onoremap <leader>li( :<c-u>normal! F)vi(<cr>
"" select header in Markdown
onoremap <leader>ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
"" inner entire buffer
onoremap ie :<c-u>execute "normal! ggVG"<cr>
"" current viewable text in the buffer
onoremap iv :<c-u>execute "normal! HVL"<cr>

" select content in pairs
inoremap <leader>ni( <esc>f(vi(
inoremap <leader>ni{ <esc>f{vi{
inoremap <leader>ni< <esc>f<vi<
inoremap <leader>ni' <esc>f'vi'
inoremap <leader>ni" <esc>f"vi"
inoremap <leader>pi( <esc>F(vi(
inoremap <leader>pi{ <esc>F{vi{
inoremap <leader>pi< <esc>F<vi<
inoremap <leader>pi' <esc>F'vi'
inoremap <leader>pi" <esc>F"vi"
inoremap <leader>na( <esc>f(va(
inoremap <leader>na{ <esc>f{va{
inoremap <leader>na< <esc>f<va<
inoremap <leader>na' <esc>f'va'
inoremap <leader>na" <esc>f"va"
inoremap <leader>pa( <esc>F(va(
inoremap <leader>pa{ <esc>F{va{
inoremap <leader>pa< <esc>F<va<
inoremap <leader>pa' <esc>F'va'
inoremap <leader>pa" <esc>F"va"


" mappings for buffer
nnoremap <leader>fn :bnext<cr>
nnoremap <leader>fp :bprevious<cr>
nnoremap <leader>fq :bp <BAR> bd #<cr>
nnoremap <leader>fl :ls<cr>
nnoremap <leader>fe :enew<cr>


"========================================= Abbreviations ==========================================================
" use to correct typos
iabbrev adn and
iabbrev tehn then
iabbrev ftm fmt
iabbrev mian main
iabbrev falied failed
iabbrev faield failed
iabbrev ft failed to
iabbrev st successfully to
iabbrev @@ louzhenlin86@126.com


" Autocmd definitions --------------------------{{{
augroup filetype_group
    autocmd!
    " auto indent html files
    autocmd BufWritePre *.html :normal gg=G
    " if
    autocmd FileType python        :iabbrev <buffer> iff if:<left>
    autocmd FileType javascript    :iabbrev <buffer> iff if ()
    " rust filetype detection
    autocmd BufRead,BufNewFile *.rs    set filetype=rust
augroup END

augroup clear_tailing_spaces
    autocmd!
    autocmd BufWritePre * :FixWhitespace
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

augroup tagbar_open
    autocmd!
    autocmd BufRead,BufNewFile *.go     :TagbarOpen
    autocmd BufRead,BufNewFile *.c      :TagbarOpen
    autocmd BufRead,BufNewFile *cpp     :TagbarOpen
    autocmd BufRead,BufNewFile *py     :TagbarOpen
augroup END

augroup golang
    autocmd!
    au FileType go nmap <leader>gr <Plug>(go-run)
    au FileType go nmap <leader>gb <Plug>(go-build)
    au FileType go nmap <leader>gt <Plug>(go-test)
    au FileType go nmap <leader>gc <Plug>(go-coverage)
augroup END

" }}}

"============================================ Builtin =============================================================
"==================================================================================================================
"Quickfix: location list in file which is used to jump between locations in files -----{{{
"==================================================================================================================
" :h quickfix / location-list
"
" :cnext    => next location
" :cprev    => previous location
" :lnext
" :lprevious
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
" [l    => lprevious
" ]l    => lnext
" }}}


"==================================================================================================================
"Tags: jump to tags -----{{{
"==================================================================================================================
" vim -t main: open and jump to the line which tag 'main' is at
" :ts       => tags list
" :tp       => tags preview
" :tn       => tags next
" <C> + ]   =>
" <C> + T   =>
"==================================================================================================================
" }}}


"===========================================Color Scheme===========================================================
"==================================================================================================================
"Molokai: color scheme -----{{{
"https://github.com/tomasr/molokai
"==================================================================================================================
let g:molokai_original = 1
"colorscheme molokai
" }}}


"==================================================================================================================
"Gruvbox: color scheme -----{{{
"https://github.com/morhetz/gruvbox
"==================================================================================================================
colorscheme gruvbox
" }}}


"==================================================================================================================
"Dracula: color scheme -----{{{
"https://github.com/dracula/vim
"==================================================================================================================
" too light
"colorscheme dracula
" }}}


"==================================================================================================================
"NERDTree: directory tree view -----{{{
"https://github.com/scrooloose/nerdtree
"==================================================================================================================
let g:nerdtree_is_open = 0
function! OpenNERDTree()
    if g:nerdtree_is_open
        let curr_win = winnr()
    else
        let curr_win = winnr() + 1
        let g:nerdtree_is_open = 1
    endif

    execute "NERDTree"
    execute "normal! \<c-w>" . curr_win . "w"
endfunction

" shortcut for NERDTree
nnoremap <leader>N :call OpenNERDTree()<cr>
" auto start
" autocmd vimenter * NERDTree
" autocmd vimenter * if !argc() | NERDTree | endif

" exit when only NERDTree left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" filter files
let NERDTreeIgnore=['\.sw[po]$', '\.[ao]$', '\.pyc$', 'tags', '\.dSYM$']
let NERDTreeWinSize=20
" sort order of files
"let NERDTreeSortOrder=['\/$', '\.rb$', '\.php$', '\.h$', '\.c$', '*', '\.sw.$', '\.bak$', '\~$']
" }}}


"==================================================================================================================
"NERDCommenter: speed up comment -----{{{
"https://github.com/scrooloose/nerdcommenter
"==================================================================================================================
"[count]<leader>cc |NERDComComment|         => Comment out the current line or text selected in visual mode.
"[count]<leader>cu |NERDComUncommentLine|   => Uncomments the selected line(s).
"[count]<leader>cn |NERDComNestedComment|   => Same as <leader>cc but forces nesting.
"[count]<leader>ct |NERDComToggleComment|   => Toggles the comment state of the selected line(s).
"[count]<leader>cm |NERDComMinimalComment|  => Comments the given lines using only one set of multipart delimiters.
"[count]<leader>ci |NERDComInvertComment|   => Toggles the comment state of the selected line(s) individually.
"[count]<leader>cs |NERDComSexyComment|     => Comments out the selected lines ``sexily'
"[count]<leader>cy |NERDComYankComment|     => Same as <leader>cc except that the commented line(s) are yanked first.
"<leader>c$        |NERDComEOLComment|      => Comments the current line from the cursor to the end of line.
"<leader>cA        |NERDComAppendComment|   => Adds comment delimiters to the end of line and goes into insert mode between them.
"<leader>ca        |NERDComAltDelim|        => Switches to the alternative set of delimiters.
"[count]<leader>cl                          => Align delimiters down left side.
"[count]<leader>cb |NERDComAlignedComment|  => Align delimiters down both side.
"==================================================================================================================
" }}}


"==================================================================================================================
"CtrlP: fuzzy file/buffer search -----{{{
"https://github.com/kien/ctrlp.vim
"==================================================================================================================
" <C> + v:  vertical split
" <C> + x:  split
" <C> + t:  tab
" <C> + d:  switch to filename only search instead of full path
" <C> + r:  regex mode
" <C> + j / k: navigate result list
"==================================================================================================================
" find file
noremap <leader>ff  :CtrlP<cr>
" find buffer
noremap <leader>fb  :CtrlPBuffer<cr>
" find MRU
noremap <leader>fm  :CtrlPMRU<cr>
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swo,*.swp,*.zip,*.o,*.a,*.pyc     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|gif|jpg|png)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" }}}


"==================================================================================================================
"Syntasitc: syntax check -----{{{
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
let g:syntastic_python_checkers = ['flake8']
" }}}


"==================================================================================================================
"Gundo: undo tree view -----{{{
"https://github.com/sjl/gundo.vim
"==================================================================================================================
noremap <leader>gu  :GundoToggle<cr>

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
" }}}


"==================================================================================================================
"Vim_indent_guide: show indent for lines -----{{{
"https://github.com/nathanaelkane/vim-indent-guides
"==================================================================================================================
" noremap <leader>ig    => open indent window
"==================================================================================================================
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=gray ctermbg=4
" }}}


"==================================================================================================================
"Template: code template -----{{{
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
" }}}


""==================================================================================================================
""Airline: lean and mean status/tabline for vim that's light as air -----{{{
"https://github.com/vim-airline/vim-airline
let g:airline_theme='gruvbox'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
" }}}


"==================================================================================================================
"Fugitive: git wrapper -----{{{
"https://github.com/tpope/vim-fugitive
"==================================================================================================================
" :Gstatus  => git status
" :Gcommit  => git commit
" :Gblame   => git blame
" :Gmove    => git mv
" :Ggrep    => git grep
"==================================================================================================================
" }}}


"==================================================================================================================
"Surround: quoting/parenthesizing made simple -----{{{
"https://github.com/tpope/vim-surround
"==================================================================================================================
" cs"'  => change surrounding. " => '
" cst"  => change surrounding to. => "
" ds"   => delete surrounding.
" ysiw] => add surrounding. text object + surrounding
"==================================================================================================================
" }}}


"==================================================================================================================
"Tagbar: display tags in window, ordered by scope -----{{{
"https://github.com/majutsushi/tagbar
"gotags: https://github.com/jstemmer/gotags => support for Golang
"==================================================================================================================
let g:tagbar_width=25
let g:tagbar_ctags_bin = "/Users/louzhenlin/dev/app/ctags-5.8/bin/ctags"
nmap <leader>tb :TagbarToggle<cr>
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
" }}}


"==================================================================================================================
"Ack: lick vimgrep use to find pattern in directory -----{{{
"==================================================================================================================
" :Ack [options] {pattern} [{directories}]
"   => Search recursively in {directory} (which defaults to the current directory) for the {pattern}
"==================================================================================================================
" }}}


"==================================================================================================================
"EasyMotion: speed up vim motion -----{{{
"https://github.com/Lokaltog/vim-easymotion
"==================================================================================================================
" <leader><leader>w/W => <Plug>(easymotion-w/W)     => move forward by word/Word
" <leader><leader>b/B => <Plug>(easymotion-b/B)     => move backward by word/Word
" <leader><leader>j => <Plug>(easymotion-j)     => move down by lines
" <leader><leader>k => <Plug>(easymotion-k)     => move up by lines
" <leader><leader>n => <Plug>(easymotion-n)     => repeat search forward
" <leader><leader>N => <Plug>(easymotion-N)     => repeat search backward
"==================================================================================================================
"" search one char
nmap s <Plug>(easymotion-s)
" search N chars
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <leader><leader>J <Plug>(easymotion-sol-j)
nmap <leader><leader>K <Plug>(easymotion-sol-k)

let g:EasyMotion_startofline = 0    " keep cursor colum when JK motion
let g:EasyMotion_smartcase = 1      " similarly to Vim's smartcase option for global searches
" }}}


"==================================================================================================================
"Tabular: text filtering and aligning -----{{{
"https://github.com/godlygeek/tabular
" :Tabularize /{sep}    =>  align by {sep}, space is add to left and right of {sep}
" :Tabularize /{sep}/{r/c/l}{num}   => r/c/l specify the alignment of the part, and will add {num} spaces before
"                                      next element
" e.g. :Tabularize /:/r1c1l0  on the below  => first part right align, and add 1 space; second part center align
"                                              and add 1 space; last part left align
"
" abc:2123
" a:2333
" djfksdjfk:11
"
" will be
"
"       abc : 2123
"         a : 2333
" djfksdjfk : 11
"
" :help \zs     =>  \zs specify the match position
"==================================================================================================================
if exists(":Tabularize")
    " align by =
    nmap <leader>t= :Tabularize /=<cr>
    vmap <leader>t= :Tabularize /=<cr>
    " align by :
    nmap <leader>t: :Tabularize /:\zs<cr>
    vmap <leader>t: :Tabularize /:\zs<cr>
endif
" }}}


"==================================================================================================================
"Repeat: enable repeating supported plugin maps "." ------{{{
"https://github.com/tpope/vim-repeat
"==================================================================================================================
" }}}


"==================================================================================================================
"Gitgutter: show git diff in the gutter, and stage/reverts hunks -----{{{
"https://github.com/airblade/vim-gitgutter
"==================================================================================================================
" <leader>hs    => stage the hunk
" <leader>hr    => revert the hunk
" <leader>hu    => undo hunk
" <leader>hp    => preview hunk
" [c            => previous hunk
" ]c            => next hunk
"==================================================================================================================
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk
" nnoremap <leader>gt :GitGutterToggle<cr>
" nnoremap <leader>gst :GitGutterSignsToggle<cr>
" let g:gitgutter_max_signs=10240
"  }}}


"=================================================================================================================s
"Unimpaired: pairs of handy bracket mappings -----{{{
"https://github.com/tpope/vim-unimpaired
" :h unimpaired
"==================================================================================================================
" }}}


"==================================================================================================================
"Vimshell: shell in vim -----{{{
"https://github.com/Shougo/vimshell.vim
"==================================================================================================================
"vimshell read ~/.vimshrc as init file
" :VimShell     => open shell
nnoremap <leader>sh :VimShellPop<cr>
nnoremap <leader>sht :VimShellTab<cr>
" }}}


"==================================================================================================================
"DirDiff: diff and merge two directories recursively -----{{{
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
" }}}


"==================================================================================================================
"YouCompleteMe: a code-completion engine -----{{{
"https://github.com/Valloric/YouCompleteMe
" YcmCompleter GoTo* add entries to Vim's 'jumplist', can use:
"   <C> + O => jump back
"   <C> + I => jump forward
" <tab> => trigger the completion suggestion anywhere
" <C> + <space> => same as the above
"
"==================================================================================================================
" recompile
nnoremap <F5> :YcmForceCompileAndDiagnostics<cr>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<cr>
" For C-family languages this only works in certain situations, namely when
" the definition of the symbol is in the current translation unit. A
" translation unit consists of the file you are editing and all the files you
" are including with #include directives (directly or indirectly) in that
" file.
"
" So, when the definition is in a .c/.cpp/.cc file, it can't be found
" ctags can be used at the situation.
"   <C> + ]     => jump to
"   <C> + t     => jump back
nnoremap <leader>jf :YcmCompleter GoToDefinition<cr>
nnoremap <leader>jg :YcmCompleter GoTo<cr>
" jump to the included file when current line is a #include
" supported: c-family
nnoremap <leader>jh :YcmCompleter GoToInclude<cr>
" supported: java, javascript, python, typescript
nnoremap <leader>jr :YcmCompleter GoToReferences<cr>
" Echos the type of the variable or method under the cursor, and where it
" differs, the derived type.
" supported: c-family, java, javascript, typescript
nnoremap <leader>gt :YcmCompleter GetType<cr>
" Displays the preview window populated with quick info about the identifier
" under the cursor.
" supported: c-family, java, javascript, python, typescript, rust
nnoremap <leader>gd :YcmCompleter GetDoc<cr>

" global ycm conf
autocmd FileType cpp let g:ycm_global_ycm_extra_conf='~/.vim/ycm_conf/cpp/.ycm_extra_conf.py'
autocmd FileType c let g:ycm_global_ycm_extra_conf='~/.vim/ycm_conf/c/.ycm_extra_conf.py'

" When this option is set to 1 YCM will ask once per .ycm_extra_conf.py file
" if it is safe to be loaded.
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
" invoke prompt of semantic completion. By default, semantic completion is
" trigged automatically after '.', '->' and '::' in insert mode
let g:ycm_key_invoke_completion = '<C-/>'
" minimum chars of trigger for competion
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_filetype_whitelist = {'cpp': 1, 'py': 1, 'c': 1, 'go': 1}
let g:ycm_collect_identifiers_from_tags_files = 1
" collect identifiers from syntax for specified language
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" disable ycm syntax checker, force to use Syntasitc
let g:ycm_show_diagnostics_ui = 0

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" }}}


"==================================================================================================================
"Json: for json -----{{{
"https://github.com/elzr/vim-json
"==================================================================================================================
" }}}


"==================================================================================================================
"TextobjUser: create your own text objects -----{{{
"https://github.com/kana/vim-textobj-user
"==================================================================================================================
"some useful examples: https://github.com/kana/vim-textobj-user/wiki
" datetime
call textobj#user#plugin('datetime', {
            \   'date': {
            \     'pattern': '\<\d\d\d\d-\d\d-\d\d\>',
            \     'select': ['ad', 'id'],
            \   },
            \   'time': {
            \     'pattern': '\<\d\d:\d\d:\d\d\>',
            \     'select': ['at', 'it'],
            \   },
            \ })
" php code in <?php ?>
call textobj#user#plugin('php', {
            \   'code': {
            \     'pattern': ['<?php\>', '?>'],
            \     'select-a': 'aP',
            \     'select-i': 'iP',
            \   },
            \ })

" for current line
call textobj#user#plugin('line', {
            \   '-': {
            \     'select-a-function': 'CurrentLineA',
            \     'select-a': 'al',
            \     'select-i-function': 'CurrentLineI',
            \     'select-i': 'il',
            \   },
            \ })

function! CurrentLineA()
    normal! 0
    let head_pos = getpos('.')
    normal! $
    let tail_pos = getpos('.')
    return ['v', head_pos, tail_pos]
endfunction

function! CurrentLineI()
    normal! ^
    let head_pos = getpos('.')
    normal! g_
    let tail_pos = getpos('.')
    let non_blank_char_exists_p = getline('.')[head_pos[2] - 1] !~# '\s'
    return
    \ non_blank_char_exists_p
    \ ? ['v', head_pos, tail_pos]
    \ : 0
endfunction
" }}}


"==================================================================================================================
"A: alternate files quickly (.c -> .h etc) -----{{{
"https://github.com/vim-scripts/a.vim
"==================================================================================================================
" :A switches to the header file corresponding to the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches
" <leader>ih switches to file under cursor
" <leader>is switches to the alternate file of file under cursor (e.g. on
" <foo.h> switches to foo.cpp)
" <leader>ihn cycles through matches
"==================================================================================================================
nnoremap <leader>h :A<cr>
nnoremap <leader>hv :AV<cr>
nnoremap <leader>hs :AS<cr>
" }}}


"==================================================================================================================
"TaskList: search current file for FIXME, TODO, and XXX and put them in a handy list -----{{{
"https://github.com/vim-scripts/TaskList.vim
"==================================================================================================================
map <leader>tl <Plug>TaskList
let g:tlTokenList = ['FIXME', 'TODO', 'XXX', '<MM>', '<MW>']
" }}}


"==================================================================================================================
"Numbers: bettern line numbers -------{{{
"https://github.com/myusuf3/numbers.vim
"==================================================================================================================
let s:numbers_exclude = ['tagbar', 'gundo', 'nerdtree']
" switch between default number and Numbers(relative number)
nnoremap <leader>sn :NumbersToggle<cr>NumbersToggle<cr>:set number<cr>
" }}}


"==================================================================================================================
"TrailingWhitespace: highlight trailing whitespace in red ------{{{
"https://github.com/bronson/vim-trailing-whitespace
"==================================================================================================================
" :FixWhitespace    => remove trailing whitespace
"==================================================================================================================
" }}}


"==================================================================================================================
"UltiSnips: The ultimate snippet solution for Vim. ------{{{
"https://github.com/sirver/ultisnips
" :UltiSnipsEdit!   => open all public snippet files for the current filetype to edit
" :UltiSnipsEdit    => open a private snippet definition file for current fietype
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="tabdo"
" directory for private snippets
let g:UltiSnipsSnippetsDir="/Users/louzhenlin/.vim"
" }}}


"==================================================================================================================
"SuperTab: Perform all your vim insert mode completions with Tab ------{{{
"https://github.com/ervandew/supertab
"let g:SuperTabDefaultCompletionType = '<C-n>'
" }}}


"==================================================================================================================
"CamelCaseMotion: A vim script to provide CamelCase motion through words ------{{{
"https://github.com/bkad/CamelCaseMotion
" <leader>w: begin of next camel word
" <leader>e: end of next camel word
" <leader>b: back to begin of previous camel word
call camelcasemotion#CreateMotionMappings('<leader>')
" }}}


"==================================================================================================================
"Argtextobj: Text-object like motion for arguments ------{{{
"https://github.com/vim-scripts/argtextobj.vim
" aa: a argument
" ia: inner argument
" e.g.
"   daa: delete an argument
"   cia: change inner argument
"   via: select inner argument
" }}}


"==================================================================================================================
"VimIndentObject: Defines a new text object representing lines of code at the same indent level. ------{{{
"https://github.com/michaeljsmith/vim-indent-object
" ai: the current indentation level and the line above
" ii: the current indentation level excluding the line above
" aI: the current indentation level and lines above/below
" }}}


"==================================================================================================================
"SpeedDating: Use CTRL-A/CTRL-X to increment dates, times, and more ------{{{
"https://github.com/tpope/vim-speeddating
" }}}


"==================================================================================================================
"VimSubversive: Vim plugin providing operator motions to quickly replace text ------{{{
"https://github.com/svermeulen/vim-subversive
"" r<motion>: e.g. riw: replace current word with current yank
nmap r <plug>(SubversiveSubstitute)
nmap rr <plug>(SubversiveSubstituteLine)
nmap R <plug>(SubversiveSubstituteToEndOfLine)

"" <leader>r<motion1><motion2>: text selected in motion1 will be replaced by
""  text we entered in the prompt for each occurrance provided by motion2
""  e.g. <leader>riwip will replace all the text in current paragraph
nmap <leader>r <plug>(SubversiveSubstituteRange)
xmap <leader>r <plug>(SubversiveSubstituteRange)
nmap <leader>rr <plug>(SubversiveSubstituteWordRange)

"" like <leader>r, but substitue in abolish way
nmap <leader><leader>r <plug>(SubversiveSubstituteRange)
xmap <leader><leader>r <plug>(SubversiveSubstituteRange)
nmap <leader><leader>rr <plug>(SubversiveSubstituteWordRange)
" }}}


"==================================================================================================================
"Abolish: easily search for, substitute, and abbreviate multiple variants of a word ------{{{
"https://github.com/tpope/vim-abolish
""
" }}}


"==================================================================================================================
"Vim_multiple_cursors: True Sublime Text style multiple selections for Vim
"https://github.com/terryma/vim-multiple-cursors
" <c-n>: add a new virtual cursor + selection on the next match
" <c-x>: skip the next match
" <c-p>: remove current virtual cursor + selection and go back on previous match
" v: go to normal model
" <esc>: back to regular vim
" }}}
