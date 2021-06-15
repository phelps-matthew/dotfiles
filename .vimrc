"-------------------------------------------------------------------------"
" Keys
"-------------------------------------------------------------------------"
color slate

let mapleader = "\<space>" 
" allow mouse in normal and visual
set mouse=nv
"for key mapping
set timeoutlen=350
"for general key code delays
set ttimeoutlen=50
imap kj <Esc>
vmap kj <Esc>
cmap kj <C-C>
"nnoremap <leader><space> za 
nnoremap <F3> :e $MYVIMRC<CR>
nnoremap <F4> :source $MYVIMRC<CR>
nnoremap <leader>\ :set nohlsearch!<cr>:set hls?<cr>
" Toggle relative or absolute number lines
function! NumberToggle()
	if(&nu == 1)
		set nu!
		set rnu
	else
		set nornu
		set nu
	endif
endfunction
nnoremap <leader>n :call NumberToggle()<CR>
" buffer management
"" open help in new window, make buffer listed
command! -nargs=1 -complete=help H :h <args> | only | :set buflisted
nnoremap <silent> <Leader>o :Buffers<CR>
map <leader>s :w<cr>
map <leader>x :q!<cr>
map <leader>as :wq<cr>
map <leader>da :bufdo bd!<cr>
map <leader>dd :bd!<cr>
map <leader>h :bp<cr>
map <leader>l :bn<cr>
" window management -w-
"set splitbelow
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <leader>wv <C-w>v
map <leader>wh <C-w>s
map <leader>wn <C-w>n
map <leader>wq <C-w>q
map <leader>wc <C-w>c
"" expand indow
map <leader>wo <C-w>o
"" previous
map <leader>w; <C-w>;
" terminal normal mode
"" completion popup w/i vim command-line
cmap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
cmap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"" code folding remap zc (main keybinds are zo and zc)
imap zi zc
vmap zi zc
nmap zi zc
"" set paste, no paste
map <Leader>tp :set paste<CR>
imap <Leader>tp :set paste<CR>
map <Leader>tn :set nopaste<CR>
imap <Leader>tn :set nopaste<CR>

" active clipboard, relative line numbers
"-------------------------------------------------------------------------"
set clipboard=unnamed
set relativenumber
" hides unsaved buffers instead of forcing e! 
set hidden
set cursorline
" search as chars are entered, highlight 
set incsearch
set hlsearch


"-------------------------------------------------------------------------"
" py folding / collapsing code
"-------------------------------------------------------------------------"
au BufNewFile,BufRead *.py set foldmethod=indent foldlevel=99 
  
"-------------------------------------------------------------------------"
" XML folding / collapsing code
" za : toggle fold
" zm : fold more
" zr : fold less
" zc : close fold
" zM : close all folds
" zR : open all folds
"-------------------------------------------------------------------------"
augroup XML
    autocmd!
    autocmd FileType xml let g:xml_syntax_folding=1
    autocmd FileType xml setlocal foldmethod=syntax
    autocmd FileType xml :syntax on
    autocmd FileType xml :%foldopen!
augroup END

"Comment highlighting in json
autocmd FileType json syntax match Comment +\/\/.\+$+

"Suggested coc default
set cmdheight=2
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

"-------------------------------------------------------------------------"
" Increase maxmempattern for big jsons (default 1000)   
"-------------------------------------------------------------------------"
set mmp=100000
