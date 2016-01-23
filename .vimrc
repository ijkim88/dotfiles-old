" Color scheme
colorscheme default2

" Set mapleader to ','
let mapleader = ","

" Turn on syntax highlighting
syntax enable

" Turn on the wild menu
"set wildmenu

" Set hidden (not sure what this does)
set hidden

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight the search results
set nohlsearch

" Highlight chars as you type search
set incsearch

" Toggle line numbers
nnoremap <leader># :set number!<cr>

" Toggle folding
nnoremap <Space> za

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Easier tab nagivation
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
"inoremap <C-[> <ESC>:tabprevious<CR>i
"inoremap <C-]> <ESC>:tabnext<CR>i
"inoremap <C-t> <ESC>:tabnew<CR>i

" Smart to move to first char and last char in a line
map H ^
map L $

" Easier way to switch between open/closing brace
map <tab> %

" Clear search
nnoremap <leader><space> :noh<cr>

" Switch between hex mode and back
nnoremap <leader>x :%!xxd<cr>
nnoremap <leader>X :%!xxd -r<cr>

" Easy edit vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>

" Source vim file
nnoremap <leader>sv :source $MYVIMRC<cr>

" Text wrap
"set wrap
"set textwidth=79
"set formatoptions=t
"set colorcolumn=85

" Fix backsapce
set backspace=2

" Remap escape key with jj
inoremap jj <ESC>

" Remap window splits
nnoremap <leader>s :split<cr><C-W>j
nnoremap <leader>vs :vsplit<cr><C-W>l

" Close split and focus
nnoremap <leader>w :on<cr>

" Shortcut to Explore
nnoremap <leader>e :Explore<cr>

" Remap ':' to ';' for efficiency
nnoremap ; :

" Auto set directory to current editing file
" set autochdir

" Shortcuts for quickfix
nnoremap co :copen<cr>
nnoremap cj :cn<cr>
nnoremap ck :cp<cr>
nnoremap cc :cclose<cr>

" Pathogen configuration
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Tab spacing based on filetype
autocmd FileType rst setlocal shiftwidth=3 tabstop=3

" Toggle Goyo.vim
nnoremap <leader>g :Goyo<cr>

" Unite
nnoremap <leader>/f :Unite -start-insert file file_rec/async<cr>
nnoremap <leader>/b :Unite buffer<cr>
nnoremap <leader>/g :Unite grep:.<cr>
nnoremap <leader>/a :Unite ack:.<cr>

" Ack
nmap <leader>a :Ack ""<left>
nmap <leader>A :Ack <C-r><C-w><cr>

"nnoremap <leader>x :set filetype=xml<cr>
"  \:source ~/.vim/bundle/xmledit/ftplugin/xml.vim<cr>

"nnoremap <leader>h :set filetype=html<cr>
"  \:source ~/.vim/bundle/xmledit/ftplugin/html.vim<cr>
