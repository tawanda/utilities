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
"noremap P "0P
for s:i in ['"','*','+','-','.',':','%','/','=','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
        execute 'noremap "'.s:i.'p "'.s:i.'p'
        execute 'noremap "'.s:i.'P "'.s:i.'P'
endfor


"The first line maps each p stroke to "0p. However, this prevents p from accessing any other registers.
"P now always pastes from yanked text 
"Therefore all p strokes with an explicitly selected register are mapped to the equivalent commandline expression within the for-loop. The same is done for P.
"This way the standard behaviour is preserved, except for the implicit p and P strokes, which now use register 0 by default.
"REF - http://stackoverflow.com/a/32488853/3571614

"--- End Fix anoying cut paste

" Search is case insenssitive unless vim detects a cpital letter
" Worth noting that for smartcase to work, you also need set ignorecase
set ignorecase
set smartcase
