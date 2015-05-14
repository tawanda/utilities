  1 imap jj <Esc>
  2 syntax on  "Enables syntax highlighting for programming languages
  3 "set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
  4 set showmatch "Highlights matching brackets in programming languages
  5 set autoindent  "If you're indented, new lines will also be indented
  6 set smartindent  "Automatically indents lines after opening a bracket in programming languages
  7 set backspace=2  "This makes the backspace key function like it does in other programs.
  8 set tabstop=4  "How much space Vim gives to a tab
  9 set number  "Enables line numbering
 10 "set smarttab  "Improves tabbing
 11 set shiftwidth=4  "Assists code formatting
 12 "setlocal spell  "Enables spell checking (CURRENTLY DISABLED because it's kinda annoying). Make sure to uncomment the next line if you use this.
 13 "set spellfile=~/.vimwords.add  "The location of the spellcheck dictionary. Uncomment this line if you uncomment the previous line.
 14 
 15 "--- The following commands make the navigation keys work like standard editors
 16 imap <silent> <down> <c-o>gj
 17 imap <silent> <up> <c-o>gk
 18 nmap <silent> <down> gj
 19 nmap <silent> <up> gk
 20 "--- Ends navigation commands
 21 
 22 "----The following enables toggling of paste on or off
 23 nnoremap <F2> :set invpaste paste?<CR>
 24 set pastetoggle=<F2>
 25 set showmode
 26 "The first line sets a mapping so that pressing F2 in normal mode will invert the 'paste' option, and will then show the value of that option.
 27 "The second line allows you to press F2 when in insert mode, to toggle 'paste' on and off.
 28 "The third line enables displaying whether 'paste' is turned on in insert mode
 29 .
 30 "--- The following adds a sweet menu, press F4 to use it.
 31 source $VIMRUNTIME/menu.vim
 32 set wildmenu
 33 set cpo-=<
 34 set wcm=<c-z>
 35 map <f4> :emenu <c-z>
 36 "--- End sweet menu
