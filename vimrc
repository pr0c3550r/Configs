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
map <F12> :w! \| !xelatex "<c-r>%"<CR>

autocmd VimLeave *.tex !texclear %

map <F5> gq
map <F4> $
