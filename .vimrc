imap jj <Esc>
syntax on  "Enables syntax highlighting for programming languages
"set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set showmatch "Highlights matching brackets in programming languages
set autoindent  "If you're indented, new lines will also be indented
set smartindent  "Automatically indents lines after opening a bracket in programming languages
set backspace=2  "This makes the backspace key function like it does in other programs.
set tabstop=4  "How much space Vim gives to a tab
set number  "Enables line numbering
"set smarttab  "Improves tabbing
set shiftwidth=4  "Assists code formatting
"setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
"set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.

"--- The following commands make the navigation keys work like standard editors
imap <silent> <down> <c-o>gj
imap <silent> <up> <c-o>gk
nmap <silent> <down> gj
nmap <silent> <up> gk
"--- Ends navigation commands

"----The following enables toggling of paste on or off
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
"The first line sets a mapping so that pressing F2 in normal mode will invert the 'paste' option, and will then show the value of that option.
"The second line allows you to press F2 when in insert mode, to toggle 'paste' on and off.
"The third line enables displaying whether 'paste' is turned on in insert mode
.
"--- The following adds a sweet menu, press F4 to use it.
source $VIMRUNTIME/menu.vim
set wildmenu
set cpo-=<
set wcm=<c-z>
map <f4> :emenu <c-z>
"--- End sweet menu

"--- Fix anoying cut paste
noremap P "0p 
" Shift p  pastes the copy register
"--- End Fix anoying cut paste

noremap A "a
noremap B "b
" access registers with a lil shortcut


" Search is case insenssitive unless vim detects a cpital letter
set ignorecase
set smartcase

" Makes F5 open the file explorere
map <F5> :E <Enter>

" From https://blog.mozhu.info/vimmers-you-dont-need-nerdtree-18f627b561c3#.oj7y8jrjf
" Makes the file explorere default view cool
let g:netrw_liststyle=3

" Makes moving between tabs easier using <F9> and <F10> keys
nnoremap <F9> :tabprevious<CR>
nnoremap <F10> :tabnext<CR>
