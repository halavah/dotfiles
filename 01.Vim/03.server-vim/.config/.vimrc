" ============================================= 01.PlugIn ===============================================

" =============================================
" 01.mapleader
" =============================================

let mapleader = ','
let g:mapleader = ','


" =============================================
" 02.syntax
" =============================================

syntax on


" =============================================
" 03.plugIn
" =============================================

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

filetype plugin indent on


" ============================================= 02.FileType =============================================

" =============================================
" 01.fileType
" =============================================

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
au BufWinEnter *.php set mps-=<:>


" =============================================
" 02.remove spaces: auto remove extra spaces
" =============================================

fun! <SID>StripTrailingWhitespaces()
    let l = line(" ." )
    let c = col(" ." )
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" =============================================
" 03.create file: auto insert file header
" =============================================
autocmd BufNewFile *.sh,*.py exec " :call AutoSetFileHead()"
function! AutoSetFileHead()
    if &filetype == 'sh'
        call setline(1, " \#!/bin/bash" )
    endif
    if &filetype == 'python'
        " call setline(1, " \#!/usr/bin/env python" )
        " call append(1, " \# encoding: utf-8" )
        call setline(1, " \# -*- coding: utf-8 -*-" )
    endif
    normal G
    normal o
    normal o
endfunc


" =============================================
" 04.highlight: some highlight keywords
" =============================================

if has(" autocmd" )
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif


" =============================================
" 05.fold: according to code file format fold
" =============================================

set foldenable

set foldmethod=indent
set foldlevel=99

let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe " normal! zM"
        let g:FoldMethod = 1
    else
        exe " normal! zR"
        let g:FoldMethod = 0
    endif
endfun


" =============================================
" 06.Do not switch to the beginning of the line
" =============================================

autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" =============================================
" 07.buffer
" =============================================

set viminfo^=%


" =============================================
" 08.buffer
" =============================================

set hidden
set wildmode=list:longest
set ttyfast


" =============================================
" 09.editing position
" =============================================

if has(" autocmd" )
  au BufReadPost * if line(" '\" " ) > 1 && line(" '\" " ) <= line(" $" ) | exe " normal! g'\" " | endif
endif


" ============================================= 03.System ===============================================

" =============================================
" 01.theme
" =============================================

if has(" gui_running" )
    set guifont=Monaco:h14
    if has(" gui_gtk2" )   " GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

set background=dark

colorscheme desert

hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif


" =============================================
" 02.mouse
" =============================================

set mouse=a

" set mouse-=a

set selection=inclusive
set selectmode=mouse,key


" =============================================
" 03.trailing space
" =============================================

set listchars=tab:>-,trail:.,precedes:<,extends:>

set list


" =============================================
" 04.TAB completion
" =============================================

set wildmenu

set wildmode=longest:list,full

set completeopt=longest,menu


" =============================================
" 05.title / cmd / mode / history
" =============================================

set title

set showcmd

set showmode

set history=1000


" =============================================
" 06.assist / reg / error / recovery
" =============================================

set shortmess=atI

set magic

set autoread

set visualbell
set noerrorbells
set t_vb=
set tm=500

set t_ti= t_te=


" ============================================= 04.Daily ===============================================

" =============================================
" 01.backup / swapfile / undofile
" =============================================

set nobackup

set noswapfile

set noundofile

set backupdir=~/.vim/.backup/

set directory=~/.vim/.swp/

set undodir=~/.vim/.undo/


" =============================================
" 02.encoding
" =============================================

set encoding=utf-8

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

set termencoding=utf-8

set fileformats=unix,dos,mac

set formatoptions+=m

set formatoptions+=B


" =============================================
" 03.search
" =============================================

set showmatch
set matchtime=2

set hlsearch

set incsearch

set ignorecase

set smartcase


" =============================================
" 04.expandtab
" =============================================

set expandtab

set smarttab

set shiftround

set autoindent

set smartindent

set shiftwidth=2

set tabstop=2

set softtabstop=2


" =============================================
" 05.Line number
" =============================================

set cursorline

set cursorcolumn

set nowrap

" set textwidth=120

set linebreak

set wrapmargin=2

set scrolloff=7

set sidescrolloff=15

set ruler

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2

set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber

autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>


" ============================================= 05.KeyMap ==============================================

" =============================================
" 01.common
" =============================================

inoremap kj <Esc>

nnoremap <leader>q :q<CR>

nnoremap <leader>w :w<CR>

cmap w!! w !sudo tee >/dev/null %

autocmd! bufwritepost .vimrc source %

map <C-S> :w<CR>

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"


" =============================================
" 02.Fn
" =============================================

noremap <F1> <Esc>"

function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

nnoremap <F3> :set list! list?<CR>

nnoremap <F4> :set wrap! wrap?<CR>

set pastetoggle=<F5>

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

au InsertLeave * set nopaste

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return " "
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" =============================================
" 03.controller
" =============================================

nnoremap <Up> :echomsg " Use k" <cr>
nnoremap <Down> :echomsg " Use j" <cr>
nnoremap <Left> :echomsg " Use h" <cr>
nnoremap <Right> :echomsg " Use l" <cr>

nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" nnoremap [b :bprevious<cr>
" nnoremap ]b :bnext<cr>

" noremap <left> :bp<CR>
" noremap <right> :bn<CR>

" inoremap <expr> <Down>     pumvisible() ? " \<C-n>" : " \<Down>"
" inoremap <expr> <Up>       pumvisible() ? " \<C-p>" : " \<Up>"
" inoremap <expr> <PageDown> pumvisible() ? " \<PageDown>\<C-p>\<C-n>" : " \<PageDown>"
" inoremap <expr> <PageUp>   pumvisible() ? " \<PageUp>\<C-p>\<C-n>" : " \<PageUp>"


" =============================================
" 04.search result
" =============================================

noremap <silent><leader>/ :nohls<CR>

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

nnoremap gv `[v`]


" =============================================
" 05.indent / line / text /space search
" =============================================

vnoremap < <gv
vnoremap > >gv

nnoremap H ^
nnoremap L $

cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

map <space> /

nnoremap / /\v
vnoremap / /\v


" =============================================
" 06.copy / cancel / select / switch key
" =============================================

map Y y$

vnoremap <leader>y " +y

nnoremap U <C-r>

map <Leader>sa ggVG

nnoremap <leader>v V`}

nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap : ;
nnoremap # *
nnoremap * #


" =========================================== 06.Multi-window ==========================================

" =============================================
" 01.Multi-window
" =============================================

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set autochdir

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" =============================================
" 02.label switch
" =============================================

map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>


" =============================================
" 03.accurate switch
" =============================================

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" =============================================
" 04.label config
" =============================================

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()


" =============================================
" 05.new label
" =============================================

nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
