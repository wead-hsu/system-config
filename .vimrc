" 
" ./vimrc
" Author: Wead Hsu <wead_hsu@github.io>
"
" Settings
" -----------------------------------------------------------------------------

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


" General Settings
set nocompatible
set history=100
set confirm
set iskeyword+=_,$,@,%,#,- 
set viminfo+=!

" Temp Directories
set nobackup                             " Enable backups
set noswapfile                         " It's the 21st century, Vim
set undofile                           " Enable persistent undo
set backupdir=~/.vim/tmp/backup
set undodir=~/.vim/tmp/undo
set viminfo='10,\"100,:20,%

" Tab Settings
set shiftwidth=2
set softtabstop=2
set expandtab

" Formatting
set number
set ruler
set autoindent
set showcmd
set hidden
set nocompatible

" File Encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 与windows共享剪贴板
set clipboard+=unnamed
 
filetype on
filetype plugin on
filetype indent on
 
 
 
" 语法高亮
syntax on
 
" 高亮字符，让其不受100列限制
":highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
":match OverLength '\%101v.*'
 
" 状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White
 
set nobackup
setlocal noswapfile
set bufhidden=hide
set linespace=0
set wildmenu
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set cmdheight=2
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set shortmess=atI
set report=0
set noerrorbells
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set ignorecase
set nohlsearch
set incsearch
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set scrolloff=3
set novisualbell
set laststatus=2
set formatoptions=tcrqn
set autoindent
set smartindent
set cindent
set tabstop=4
set softtabstop=2
set shiftwidth=2
set noexpandtab
set wrap
set smarttab
 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序
let Tlist_Sort_Type = "name"
 
" 在右侧显示窗口
let Tlist_Use_Right_Window = 1
 
" 压缩方式
let Tlist_Compart_Format = 1
 
" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1
 
" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0
 
" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0
 
 
if has("autocmd")
  autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
  autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
  autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o
  autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
  autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
endif "has("autocmd")


" Plugins
" -----------------------------------------------------------------------------

"##############################################################################
" Colors & Airline
"##############################################################################

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
let g:airline_left_sep='⮀'
let g:airline_right_sep='⮂'
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

"##############################################################################
" Ctrl-P
"##############################################################################

let g:ctrlp_map = '<C-f>'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
  \ 'PrtSelectMove("k")':   ['<c-e>', '<up>'],
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

"##############################################################################
" EasyMotion
"##############################################################################

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

"##############################################################################
" folding styles
"##############################################################################

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

set foldmethod=expr
set foldexpr=FoldLevels()
set foldtext=NeatFoldText()
nnoremap <Space> za

" Functions
" -----------------------------------------------------------------------------

"###################################################################
" Functions
"###################################################################
"
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
" F5编译和运行C程序，F6编译和运行C++程序
 
" C的编译和运行
map <F4> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc
 
" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

" python的编译和运行
map <F7> :call CompileRunPython()<CR>
func! CompileRunPython()
exec "w"
exec "!python %<.py"
endfunc

map <F9> :call SaveInputData()<CR>
func! SaveInputData()
exec "tabnew"
exec 'normal "+gP’
exec "w! /tmp/input_data"
endfunc

" Specific Filetypes
" -----------------------------------------------------------------------------

let g:tex_flavor = "latex"

augroup filetypes
  autocmd!
  autocmd BufNewFile,BufRead *.Rtex set filetype=rtex
  autocmd BufNewFile,BufRead *.md,*.Rmd set filetype=markdown
  autocmd BufNewFile,BufRead *.Rhtml,*.hbs set filetype=html
  autocmd FileType plaintex,tex,rtex call TexMacros()
"temp
  autocmd FileType plaintex,tex,rtex set foldmethod=marker
  autocmd FileType plaintex,tex,rtex nnoremap <silent> <Leader>s :call OpenPDF()<CR>
  autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
  autocmd Filetype markdown call Markdown()
augroup END

function! s:Expr(default, repl)
  " Allows abbreviations starting with \
  if getline('.')[col('.')-2]=='\'
    return "\<bs>".a:repl
  else
    return a:default
  endif
endfunction

function! TexMacros()
  " Map TeX macros
  inoreabbrev mb <c-r>=<sid>Expr('mb', '\mathbb')<cr>
  inoreabbrev mc <c-r>=<sid>Expr('mc', '\mathcal')<cr>
  inoreabbrev mf <c-r>=<sid>Expr('mf', '\mathfrak')<cr>
  inoreabbrev ms <c-r>=<sid>Expr('ms', '\mathscr')<cr>
  inoreabbrev mrm <c-r>=<sid>Expr('mrm', '\mathrm')<cr>
  inoreabbrev trm <c-r>=<sid>Expr('trm', '\textrm')<cr>
  inoreabbrev op <c-r>=<sid>Expr('op', '\operatorname')<cr>
  inoreabbrev tt <c-r>=<sid>Expr('tt', '\text')<cr>
  inoreabbrev tbf <c-r>=<sid>Expr('tbf', '\textbf')<cr>
  inoreabbrev tit <c-r>=<sid>Expr('tit', '\textit')<cr>
  inoreabbrev tsc <c-r>=<sid>Expr('tsc', '\textsc')<cr>
  inoreabbrev ttt <c-r>=<sid>Expr('ttt', '\texttt')<cr>
  inoreabbrev bs <c-r>=<sid>Expr('bs', '\backslash')<cr>
  inoreabbrev tbs <c-r>=<sid>Expr('tbs', '\textbackslash')<cr>
  inoreabbrev hat <c-r>=<sid>Expr('hat', '\widehat')<cr>
  inoreabbrev tilde <c-r>=<sid>Expr('tilde', '\widetilde')<cr>
  inoreabbrev sub <c-r>=<sid>Expr('sub', '\subset')<cr>
  inoreabbrev sup <c-r>=<sid>Expr('sup', '\supset')<cr>
  inoreabbrev sube <c-r>=<sid>Expr('sube', '\subseteq')<cr>
  inoreabbrev supe <c-r>=<sid>Expr('supe', '\supseteq')<cr>
  inoreabbrev latex <c-r>=<sid>Expr('latex', '\LaTeX')<cr>
endfunction

function! OpenPDF()
  " Open the pdf of the present working file
  silent !zathura "%:r.pdf" &
endfunction

function! TeXCompile()
  " Compile tex file in its working directory and remove auxiliary outputs
  if &filetype=='tex'
    " TODO: Set it to run in background somehow. Then if it never updates/errors, have a keybind to do rubber-info
    "if @% == "[0-9]+-lecture-[0-9]{2}.tex"
    "  compile master
    "else
      cd %:p:h
      !xelatex "%"
      silent !rm "%:r.aux"
      silent !rm "%:r.log"
      silent !rm "%:r.out"
    "endif
  endif
  if &filetype=='rtex'
    cd %:p:h
    !Rscript -e "library(knitr); knit('%')"
    !rubber -d "%:p:r.tex"
    silent !rm "%:r.aux"
    silent !rm "%:r.log"
    silent !rm "%:r.out"
    silent !rm "%:r.tex"
  endif
endfunction

function! Markdown()
  " Use folding style based on subsection headings
  function! MarkdownFoldLevels()
    let thisline = getline(v:lnum)
    if match(thisline, '^##[^#]') >= 0
      return ">1"
    elseif thisline != ''
      let nextline = getline(v:lnum + 1)
      if match(nextline, '-\{5,\}$') >= 0
        return ">1"
      endif
    endif
    return "="
  endfunction
  setlocal foldexpr=MarkdownFoldLevels()
endfunction
