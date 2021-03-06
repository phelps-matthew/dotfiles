"-------------------------------------------------------------------------"
" Keys
"-------------------------------------------------------------------------"
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
tmap kj <Esc>
"nnoremap <leader><space> za 
nnoremap <F3> :e $MYVIMRC<CR>
nnoremap <F4> :source $MYVIMRC<CR>
nnoremap <F9> :MundoToggle<CR>
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
tmap <C-t> <C-\><C-n>
"" completion popup w/i vim command-line
cmap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
cmap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
"" vimux flow -e-
map <Leader>ep :VimuxPromptCommand<CR>
map <Leader>el :w<cr>:VimuxRunLastCommand<CR>
map <Leader>ei :VimuxInspectRunner<CR>
map <Leader>ez :VimuxZoomRunner<CR>
"" code folding remap zc (main keybinds are zo and zc)
imap zi zc
vmap zi zc
nmap zi zc
"" set paste, no paste
map <Leader>tp :set paste<CR>
imap <Leader>tp :set paste<CR>
map <Leader>tn :set nopaste<CR>
imap <Leader>tn :set nopaste<CR>




"-------------------------------------------------------------------------"
"######### vim-plug begin ###########
"-------------------------------------------------------------------------"
call plug#begin('~/.config/nvim/plugged')
 
" py PEP8 indentation
Plug 'https://github.com/Vimjas/vim-python-pep8-indent.git'

" ALE asynchronous lint engine
Plug 'dense-analysis/ale'

" fzf fuzzy search (also install)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/fzf.vim'

" airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git wrapper inside vim
Plug 'https://github.com/tpope/vim-fugitive.git'

" gruvbox color theme
Plug 'morhetz/gruvbox'

" coc engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" semshi syntax highlighting. Needs gruvdboxd overhaul
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" undo tree
Plug 'simnalamburt/vim-mundo'

" send shell commands to tmux window
Plug 'benmills/vimux'

" Vim terminal improvement
" Plug 'kassio/neoterm'

" window navigation between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" copy vim airline style to tmux
Plug 'edkolev/tmuxline.vim'

" Buggy. Puts markers in gutter.
Plug 'clwyd/vim-signature'

" simple code folding. recommends installing FastFold
" See :help fold-commands
Plug 'tmhedberg/SimpylFold'

call plug#end()
"-------------------------------------------------------------------------"
"######## vim-plug end ############
"-------------------------------------------------------------------------"

"-------------------------------------------------------------------------"
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
" ALE configuration:
"-------------------------------------------------------------------------"
"" Set linters explicitly (flake8 only asynch. linter currently)
let g:ale_linters = {
     \   'python': ['flake8', 'pylint'],
     \   'ruby': ['standardrb', 'rubocop'],
     \   'javascript': ['eslint'],
     \}
let g:ale_completion_enabled = 0
"" Fix the code with black upon saving or F10
let g:ale_fixers = {'python': ['black']}
let g:ale_python_black_options = '-l 88'
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_fix_on_save = 0
nmap <F10> :ALEFix<CR>
"" ALE status in airline
let g:airline#extensions#ale#enabled = 1
"" Navigate through errors
nmap <silent> <leader>aj <Plug>(ale_previous_wrap)
nmap <silent> <leader>ak <Plug>(ale_next_wrap)
nmap <F6> <Plug>(ale_toggle)
" Toggle ALE globally



"-------------------------------------------------------------------------"
" coc.nvim config
"-------------------------------------------------------------------------"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"


"Comment highlighting in json
autocmd FileType json syntax match Comment +\/\/.\+$+
"Suggested coc default
set updatetime=300
let g:coc_global_extensions = ['coc-python']
set cmdheight=2
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use shift+K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


"-------------------------------------------------------------------------"
" guvbox activate
"-------------------------------------------------------------------------"
let g:gruvbox_italic=1
colorscheme gruvbox


"-------------------------------------------------------------------------"
" fzf
"-------------------------------------------------------------------------"
nnoremap <leader>f :FZF --reverse --border<cr>
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

let g:fzf_layout = { 'left': '~40%' } 
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1



"-------------------------------------------------------------------------"
" air-line
"-------------------------------------------------------------------------"
let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.whitespace = 'Ξ'
"Missing this font in delugia. Normally three horizontal bars
"let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
" Seem to have some sort of problem on windows displaying full path in center
" bottom bar. The below command also affects tabline
"let g:airline#extensions#tabline#fnamemod = ':p:~'


"-------------------------------------------------------------------------"
" tmuxline
"-------------------------------------------------------------------------"
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'win'  : '#W',
      \'cwin' : '#W',
      \'x'    : '%l:%M %p',
      \'y'    : '%m/%d/%y',
      \'z'    : '#H'}


"-------------------------------------------------------------------------"
" ipbd breakpoint toggle. vim-signature breakpoint gutter marker not working
" well
"-------------------------------------------------------------------------"
func! s:SetBreakpoint()
	cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . '# fmt: on')
	cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb,os; ipdb.set_trace(context=30)  # noqa')
	cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . '# fmt: off')
endf
func! s:RemoveBreakpoint()
	exe 'silent! g/^\s*import\sipdb,os\;\?\n*\s*ipdb.set_trace(context=\d*)/d'
	exe 'silent! g/^\s*#\sfmt\:\so.*./d'
endf
func! s:ToggleBreakpoint()
	if getline('.')=~#'^\s*import\sipdb' || getline('.')=~#'^\s*#\sfmt\:\so.*.'
		execute "normal m\*\<CR>"
		cal s:RemoveBreakpoint() 
	else
		cal s:SetBreakpoint()
		execute "normal m8\<CR>"
	endif
endf

nnoremap <leader>ei :call <SID>ToggleBreakpoint()<CR>
