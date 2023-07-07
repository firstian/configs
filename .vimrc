set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'vim-scripts/indentpython.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'scrooloose/nerdtree'

Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'nvie/vim-flake8'
Plugin 'stephpy/vim-yaml'
Plugin 'chiel92/vim-autoformat'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Change the leader key to ',' from '\'
let mapleader = ","

" Python development
" Execute current script
nmap <Leader>p :w<CR>:!python3 %<CR>


" Set up split so the cursor end up in the new split buffer
set splitbelow
set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-]> g<C-]>

" Folding
set foldenable	" Turn on folding
set foldmethod=indent	" Make folding indent sensative
set foldlevel=99	" Don't autofold anything

" Enable folding with the spacebar
nnoremap <space> za

" Key mapping
" not to break on words
set linebreak

" fixing up moving line by line in the paragraph
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

set encoding=utf-8    " Python needs UTF8

set backspace=2       " Fix how backspace behaves.
set incsearch
set ruler showcmd

" Search highlight option and mappings
set hlsearch
" Press Space to turn off highlighting and blank message.
" :noremap <silent> <Space> :silent noh<bar>:echo ""<CR> conflict with za

" Move the annoying F1 to open BufExplorer.
map <F1> :BufExplorer<CR>

" " Toggle highlighting on/off.
:noremap <F4> :set hls!<CR>:set hls?<CR>

map <silent> <C-n> :NERDTreeToggle<CR>

" Exit quickly when:
" - this plugin was already loaded
" - when 'compatible' is set
" - some autocommands are already taking care of compressed files
if exists("loaded_gzip") || &cp || exists("#BufReadPre#*.gz")
  finish
endif
let loaded_gzip = 1

augroup gzip
  " Remove all gzip autocommands
  au!

  " Enable editing of gzipped files.
  " The functions are defined in autoload/gzip.vim.
  "
  " Set binary mode before reading the file.
  " Use "gzip -d", gunzip isn't always available.
  autocmd BufReadPre,FileReadPre	*.gz,*.bz2,*.Z setlocal bin
  autocmd BufReadPost,FileReadPost	*.gz  call gzip#read("gzip -dn")
  autocmd BufReadPost,FileReadPost	*.bz2 call gzip#read("bzip2 -d")
  autocmd BufReadPost,FileReadPost	*.Z   call gzip#read("uncompress")
  autocmd BufWritePost,FileWritePost	*.gz  call gzip#write("gzip")
  autocmd BufWritePost,FileWritePost	*.bz2 call gzip#write("bzip2")
  autocmd BufWritePost,FileWritePost	*.Z   call gzip#write("compress -f")
  autocmd FileAppendPre			*.gz  call gzip#appre("gzip -dn")
  autocmd FileAppendPre			*.bz2 call gzip#appre("bzip2 -d")
  autocmd FileAppendPre			*.Z   call gzip#appre("uncompress")
  autocmd FileAppendPost		*.gz  call gzip#write("gzip")
  autocmd FileAppendPost		*.bz2 call gzip#write("bzip2")
  autocmd FileAppendPost		*.Z   call gzip#write("compress -f")
augroup END

" Turn on programming specific options
set showmatch
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

augroup vimrcEx
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

augroup c
  au!
  au BufReadPre,FileReadPre *.c,*.cc,*.h,*.cp,*.cpp,*.hpp
        \ set sw=2 ts=2 sts=2 tw=79 expandtab autoindent fileformat=unix nu
augroup END

augroup python
  au!
  au BufNewFile,BufRead *.py
        \ set ts=2 sts=2 sw=2 tw=79 expandtab autoindent fileformat=unix nu
  au FileType python map <buffer> <Leader>f :call Flake8()<CR>
augroup END

augroup html
  au!
  au BufReadPre,FileReadPre *.html,*.htm,*.css,*.xml,*.js
        \ set sw=2 ts=2 sts=2 tw=79 expandtab autoindent fileformat=unix nu
augroup END

augroup Binary
  au!
  au BufReadPre  *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM let &bin=1
  au BufReadPost *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd
  au BufReadPost *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM set ft=xxd | endif
  au BufWritePre *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd -r
  au BufWritePre *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM endif
  au BufWritePost *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM if &bin | %!xxd
  au BufWritePost *.bin,*.BIN,*.exe,*.o,*.obj,*.OBJ,*.rom,*.ROM set nomod | endif
augroup END

" add yaml stuffs
augroup yaml
  au!
  au BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
  au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
augroup END

" Set continuation lines to indent only 4 spaces
set cinoptions=+4,(4,g0,x

let python_highlight_all=1
syntax enable
set regexpengine=0

" Set up vim to look for tags file in parent directories.
set tags=tags;/

" Below are sourced from
" https://github.com/changemewtf/no_plugins/blob/master/no_plugins.vim
"
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" File browsing
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Ignore whitespace in diff mode
if &diff
    " diff mode
    set diffopt+=iwhite
endif
