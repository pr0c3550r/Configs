":::::::::::::::::::::::::::::::::::::::::::::::::
" Vimrc of pr0c3550r's vim configuration
" General for editing in all purposes with vim
" 
" Version: 1.1
" Last Canged:26.12.2021 
" Maintained By: pr0c3550r
":::::::::::::::::::::::::::::::::::::::::::::::::

"Mapping leader key to <space> and <,>
let mapleader = " "
map , <leader>

"Setting vim to not compatible: no compatabiliy mode for old vi
set nocompatible 

"Setting syntax highlighting on  
syntax on

"Setting filetypedetection on
filetype on
filetype plugin on

"Setting indentation for different filetypes on
filetype indent on 

"Setting autoindentation on
set autoindent

"Setting the path variable for making searching files easier
set path+=**

"Setting the wildmenu on with tabs 
set wildmenu

"Setting the wildmenu to showing all options
set wildmode=full

"Setting a more natural splitting behavior; 
"vsp splits to the right now and sp to the bottom
set splitbelow splitright

"Setting to not show the ruler bar on the bottom
set noruler

"Setting the search not to highlight
set nohlsearch

"Setting numbers and showing the relative numbers from the current line
set number relativenumber

"Setting the search to ignore case sensitivity
set ignorecase

"Setting the search to be smart about case sensitivity
set smartcase

"Setting vim to show the command which is executed
set showcmd

"Setting vim to show matching brackets
set showmatch

"Setting vim to center the current line when possible
set scrolloff=999

"Mappings to make navigating splits easier;
"just Ctrl and vim nav key not Ctrl+w and then vim nav key
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Mappings to make split resizing easier;
"<leader> + <Arrowkey>
noremap <leader><Left> :vertical resize +1<cr>
noremap <leader><Down> :resize -1<cr>
noremap <leader><Up> :resize +1<cr>
noremap <leader><Right> :vertical resize -1<cr>

"Mapping to make swapping Splits easier
map <leader>r <C-w>R

"Mapping to break the current split into a new tab
map <leader>T <C-w>T

"Mapping to yank the current line
map Y yy

"Mappings for tab commands
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

"Mappings to load skeletons of different filetypes
noremap <leader>java :-1read $HOME/.vim/skeletons/skeleton.java<cr>2j2wi
noremap <leader>tex :-1read $HOME/.vim/skeletons/skeleton.tex<cr>68j3wa
noremap <leader>c :-1read $HOME/.vim/skeletons/skeleton.c<cr>3ji

"Mapping to write a read only fily with doas
cnoremap w!! execute 'silent! write !doas tee % >/dev/null' <bar> edit!

"Mapping to write a read only file with sudo
"cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Setting backspace to behave like backspace and not like in vi
set backspace=eol,start,indent

"Setting colorscheme
colo gruvbox
"Setting background scheme
set bg=dark
"Making background to look like terminal background
highlight Normal guibg=NONE ctermbg=NONE
noremap <leader>setbg :highlight Normal guibg=NONE ctermbg=NONE 

"Mapping <F5> to be the compile key in every mode to compile the file
map <F5> :call CompileRun()<cr>
imap <F5> <Esc>:call CompileRun()<cr>
vmap <F5> <Esc>:call CompileRun()<cr>
map <leader>x :call CompileRun()<cr>

"Function to compile the current file based on its file ending
func! CompileRun()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
	elseif &filetype == 'java'
		exec "!javac -d . %"
	elseif &filetype == 'tex'
		exec "!xelatex %"
	endif
endfunc

":::::::::::::::::::::::::::::::::::::::::::::::::

"End of file

":::::::::::::::::::::::::::::::::::::::::::::::::
