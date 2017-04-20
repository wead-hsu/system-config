" 
" ./vimrc
" Author: Wead Hsu <wead_hsu@github.io>
"
" Settings
" -----------------------------------------------------------------------------

"==============================================================================
" Settings for Vundle
"==============================================================================

set nocompatible              
filetype off                
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'

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


"==============================================================================
" General Settings
"==============================================================================

" ignore files with certain extas
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" highlight cursor column
set cursorcolumn
" highlight cursor row
set cursorline

" print the content in the terminal after exiting
" set t_ti= t_te=

" general settings
set nocompatible
set history=2000
set confirm
set iskeyword+=_,$,@,%,#,- 
set viminfo+=!

" set backup
set backup
set backupext=.bak
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
setlocal noswapfile

" Enable persistent undo
set undofile                           

" Remember info about open buffers on close
set viminfo='10,\"100,:20,%

" Formatting
set number
set autoindent
set hidden
set nocompatible

" File Encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 与windows共享剪贴板
" set clipboard+=unnamed
 
filetype on
filetype plugin on
filetype indent on
 
" Syntax highlight
syntax on
 
" read file automatically after modification
" set autoread

" Status color
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

" settings for mouse
set mouse=a
set mousehide

" setting for selection
set selection=exclusive
set selectmode=mouse,key
 
" change the terminal's title
set title

" settings for backspace
set backspace=2
set whichwrap+=<,>,h,l
 
" For regular expressions turn magic on
set magic


"==============================================================================
" Display Settings
"==============================================================================
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

set showcmd

" keep the minimum number of lines below or above the cursor
set scrolloff=7
set bufhidden=hide
set linespace=0
set wildmenu
set cmdheight=2
set shortmess=atI
set report=0
set noerrorbells
set fillchars=vert:\ ,stl:\ ,stlnc:\

" highlight the matching brackets
set showmatch
set matchtime=5

" highlight search matches
set hlsearch
set incsearch
set ignorecase
set smartcase

set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set novisualbell
set laststatus=2
set formatoptions=tcrqn

" settings for indent
set autoindent
set smartindent
set cindent
set noexpandtab

" do not new line
set wrap
set smarttab


"==============================================================================
" Folding Styles
"==============================================================================

function! FoldLevels()
  let thisline = getline(v:lnum)
  if thisline != ''
    let nextline = getline(v:lnum + 1)
    if match(nextline, '-\{5,\}$') >= 0
      return ">1"
    endif
  endif
  return "="
endfunction

function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('»' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldmethod=syntax
set foldexpr=FoldLevels()
set foldtext=NeatFoldText()
nnoremap <Space> za
 
if has("autocmd")
  autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
  autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
  autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
  autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
  autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
  autocmd Filetype python set tabstop=4 shiftwidth=4 softtabstop=4 smarttab expandtab shiftround
endif "has("autocmd")


" Plugins
" -----------------------------------------------------------------------------

"==============================================================================
" Ctags 
"==============================================================================
let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Exist_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0


"==============================================================================
" Colors & Airline
"==============================================================================

" Temporary until I can get monokai working for terminal
if has('gui_running')
  colorscheme molokai
else
  colorscheme Tomorrow-Night
endif
syntax enable
set guioptions=
set notitle
set guifont=tewi\ 8
set laststatus=2
set noshowmode
let g:airline_theme='molokai'
"augroup airlineTheme
  "autocmd!
  "autocmd VimEnter * AirlineTheme monokai
"augroup END
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_section_c='%f%m'
let g:airline_section_x=''
let g:airline_section_y="%{strlen(&filetype)>0?&filetype:''}"
let g:airline_section_z='%p%%'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'n'  : 'N',
  \ 'i'  : 'I',
  \ 'R'  : 'R',
  \ 'c'  : 'C',
  \ 'v'  : 'V',
  \ 'V'  : 'V·L',
  \ '' : 'V·B',
  \ 's'  : 'S',
  \ 'S'  : 'S·L',
  \ '' : 'S·B',
  \ }


"==============================================================================
" Ctrl-P
"==============================================================================

let g:ctrlp_map = '<C-f>'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
  \ 'PrtHistory(-1)':     [''],
  \ 'PrtCurEnd()':      [''],
  \ }
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
set wildignore+=*.doc,*.docx,*.ods,*.xlsx
set wildignore+=*.db,*.epub,*.lnk,*.mobi,*.pdf
set wildignore+=*.git,*.pyc,*.pyo,*.exe,*.dll,*.obj,*.o,*.a,*.lib,*.so,*.dylib
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.flac,*.mp3
set wildignore+=*.mkv
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg


"==============================================================================
" EasyMotion
"==============================================================================

" Keys are written by optimizin via homerow, then tweaked by personal preference
let g:EasyMotion_keys = 'hneiotsradluygpfwqkmvc;xzbjEIOTSRAHDLUYGPFWQKMVCXZBJ'
" I require only two EasyMotion keybinds for all my nifty teleportation: f/F. The 'f/F' defaults are set for normal/visual
" modes, and the 't/T' defaults are set for operator mode (primarily d/c/y)
let g:EasyMotion_mapping_f = 'f'
let g:EasyMotion_mapping_F = 'F'
let g:EasyMotion_mapping_t = 't'
let g:EasyMotion_mapping_T = 'T'
augroup tilthefs
  autocmd!
  autocmd VimEnter * omap f t
  autocmd VimEnter * omap F T
augroup END


"==============================================================================
" neocomplete
"==============================================================================

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"==============================================================================
" Functions
"==============================================================================
 
" Press F4 to run file as C file
map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc
 
" Press F6 to run file as C++ file
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

" Press F7 to run file as C++ file
map <F7> :call CompileRunPython()<CR>
func! CompileRunPython()
exec "w"
exec "!CUDA_VISIBLE_DEVICES=cpu0 python3 %<.py"
endfunc

" Press F9 to save input data
map <F9> :call SaveInputData()<CR>
func! SaveInputData()
exec "tabnew"
exec 'normal "+gP'
exec "w! /tmp/input_data"
endfunc


"==============================================================================
" Tmux 
"==============================================================================
if exists('$TMUX')
    set term=screen-256color
endif
