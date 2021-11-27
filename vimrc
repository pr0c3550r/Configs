let mapleader = ","
set nocompatible 
syntax on
filetype on
filetype plugin on
filetype indent on 
set autoindent
set path+=**
set wildmenu
set wildmode=full
set splitbelow splitright
set noruler
set hlsearch
set number
set ignorecase
set smartcase
set showcmd
set showmatch

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <Left> :vertical resize +1<cr>
map <Down> :resize -1<cr>
map <Up> :resize +1<cr>
map <Right> :vertical resize -1<cr>

map <leader>r <C-w>R
map <leader>T <C-w>T

map Y yy

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

noremap <leader>java :-1read $HOME/.vimnew/skeletons/skeleton.java<cr>2j2wi
noremap <leader>tex :-1read $HOME/.vimnew/skeletons/skeleton.tex<cr>68j3wa
noremap <leader>c :-1read $HOME/.vimnew/skeletons/skeleton.c<cr>3ji

cnoremap w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!

set backspace=eol,start,indent

colo gruvbox
set bg=dark
highlight Normal guibg=NONE ctermbg=NONE

map <F5> :call CompileRun()<cr>
imap <F5> <Esc>:call CompileRun()<cr>
vmap <F5> <Esc>:call CompileRun()<cr>

func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
	elseif &filetype == 'java'
		exec "!javac %"
	elseif &filetype == 'tex'
		exec "!xelatex %"
	endif
endfunc
