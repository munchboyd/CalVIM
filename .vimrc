" bundles
call pathogen#runtime_append_all_bundles()

filetype plugin on
filetype plugin indent on

colorscheme elflord

set noic
set softtabstop=4
set expandtab
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
		  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
		  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set nobackup
set noswapfile
set pastetoggle=<F2>
set nocompatible

" toggle NERDTree
map <F4> :NERDTreeToggle<CR>

" ignore python cruft
let NERDTreeIgnore=['\.pyc']
set wildignore=*.py[co]

"toggle TagBar
nnoremap <silent> <F3> :TagbarToggle<CR>

" toggle fugitive status
map <silent><leader>s :Gstatus<CR>
" toggle fugitive diff
map <silent><leader>d :Gdiff<CR>

" insert newline but dont enter insert mode
map <silent><leader><Enter> o<Esc>k

" tabbing
map <silent><A-right> :tabnext<CR>
map <silent><A-left> :tabprevious<CR>
map <silent><A-x> :tabclose<CR>

" clear search highlight
nnoremap <leader><space> :noh<CR>

" clipboard
set clipboard="+

" shortcuts
nnoremap ; :

:set hidden
" clear ^M messup
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

set gfn=Inconsolata\ Medium\ 14
set background=light
colorscheme molokai

set tags+=/home/tuxcanfly/.tags/django13.tags
set path+=new_templates,templates,apps
let g:closetag_default_xml=1

" open gf in new tab
:nnoremap gf <C-W>gf

"new tab
map <Leader>t :tabnew<CR>
set includeexpr=substitute(v:fname,'\\.','/','g')
set suffixesadd=.py

let g:sparkupNextMapping = '<c-h>'

map <leader>gp :%vimgrep <cword> **/*.py<CR>
map <leader>gh :%vimgrep <cword> **/*.html<CR>

" prevent cursor jumping
noremap <S-Up> <Up>
noremap <S-Down> <Down>

" remove trailing whitespace
map <leader>w :FixWhitespace<CR>

" paste without yanking
vmap r "_dP

"copy
vmap <F8> "+ygv"zy`>
"paste (Shift-F8 to paste after normal cursor, Ctrl-F8 to paste over visual selection)
nmap <F8> "zgP
nmap <S-F8> "zgp
imap <F8> <C-r><C-o>z
vmap <C-F8> "zp`]
cmap <F8> <C-r><C-o>z
"copy register
autocmd FocusGained * let @z=@+

" stealing tpope's statusline
set statusline=[%n]%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

function! s:Gentags()
    :! find -name \*.py -print | xargs ptags.py
endfunction

nmap <F5> :Gentags<CR>

nmap <leader>fp :Git push<CR>
nmap <leader>fm :Git pull<CR>

set path+=surveys/templates,accounts/templates
