let mapleader =","
set noruler
set bg=dark
colo gruvbox
syntax on
set number relativenumber
set nohlsearch
filetype indent on 
set autoindent 
set clipboard+=unnamesplus
set wildmode=longest,list,full
set splitbelow splitright

highlight Normal guibg=NONE ctermbg=NONE

map <leader>c :w! \| !xelatex "<c-r>%"<CR>
"map <leader>p :!zathura *.pdf <c-r>%<CR><CR>

autocmd VimLeave *.tex !texclear %

cnoremap w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map Q gq
