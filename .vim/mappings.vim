" noremap <up> <Nop> " disable arrow keys in normal mode
" nnoremap <down> <Nop>
" nnoremap <left> <Nop>
" nnoremap <right> <Nop>

" inoremap <up> <Nop> " disable arrow keys in the insert mode
" inoremap <down> <Nop>
" inoremap <left> <Nop>
" inoremap <right> <Nop>

" use kj  to simulate ESC in the insert mode
inoremap kj <ESC>

" Map <leader> key
let mapleader=";"

" for NERDTree
noremap <C-n> :NERDTreeToggle<CR>

" reload the current file
noremap <Leader>r :e!<CR>
noremap <Leader>w :w<CR>
noremap <Leader>; :
