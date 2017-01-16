" Sets default theme
colorscheme desert

" sets jj to escape
imap jj <Esc>

" Exclude files and directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

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

" ====================================== SCRIPTS ===========================================================

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" -----------------------------------sessions----------------------------------------------------------------------------
" Each time you exit Vim it will save the current session under ~/.vim/sessions and load it back again once Vim is opened without any arguments. 
" It's also based on you current path, so if you open Vim from different directories you will have different sessions, 
" which is quite useful when working on different projects
" REF: http://stackoverflow.com/questions/1642611/how-to-save-and-restore-multiple-different-sessions-in-vim

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction

" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
endif
au VimLeave * :call MakeSession()




