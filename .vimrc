set encoding=utf-8
source $HOME/.vim/mappings.vim
source $HOME/.vim/tabs.vim
"source $HOME/.vim/spellcheck.vim
"source $HOME/.vim/kfj-bundle.vim
"source $HOME/.vim/plugins.vim
source $HOME/.vim/fonts.vim
source $HOME/.vim/tagbar.vim
source $HOME/.vim/abbreviations.vim

set background=dark

" To support chinese
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set number
syntax enable
syntax on
set mouse=a

vnoremap <C-y> "+y
nnoremap <C-p> "*p

" Disable backups and .swp files
set nobackup
set nowritebackup
set noswapfile

" Ignore case when searching
set ignorecase
set smartcase

" Set terminal window title
set title

colorscheme elflord
set cursorline


set foldmethod=marker
set foldmarker={,}
set foldlevel=1
set nofoldenable "disable fold by default

let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99

" for "find", "ls" and "b"
set path+=**
set wildmenu

set showcmd
let g:indentLine_setConceal = 0
set conceallevel=0

autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
autocmd BufRead,BufNewFile *.cuh set filetype=cpp
autocmd BufRead,BufNewFile *.cu set filetype=cpp

" use tab to do autocompletion for neovim
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" press ctrl + L to remove highlighted search results
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

" Disable highlighting matched parentheses. It's really annoying.
let g:loaded_matchparen=1

let g:ctrlp_custom_ignore = 'data\|DS_Store\|.git'

" 添加自动插件 autoload, 但打开后会变慢！比较难受...
execute pathogen#infect()
filetype plugin indent on

" press F5 to exec current Python code"
"
"map <F5> :call PRUN()<CR>
"func! PRUN()
"    exec "w"
"    if &filetype == 'python'
"        exec "!python %"
"    endif
"endfunc


" press F5 to exec current Python code (Debug version)"
" pip install line_profiler
nnoremap <F5> :call CompileRunGcc()<cr>

func! CompileRunGcc()
          exec "w"
          if &filetype == 'python'
                  if search("@profile")
                          exec "AsyncRun kernprof -l -v %"
                          exec "copen"
                          exec "wincmd p"
                  elseif search("set_trace()")
                          exec "!python3 %"
                  else
                          exec "AsyncRun -raw python3 %"
                          exec "copen"
                          exec "wincmd p"
                  endif
          endif

endfunc
