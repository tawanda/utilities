# USES VIMPLUG TO INSTALL PLUGINS THAT HELP MAKE VIM MORE OF AN IDE

set clipboard=unnamedplus
set mouse=a
set nu
"set autoindent
"set expandtab
set tabstop=2
set shiftwidth=2
"set smartindent
" helper for indent mistake
set list listchars=tab:»·,trail:·

" sets jj to escape
imap jj <Esc>
"imap <Space><Space> <Enter>
imap ii <Enter>
imap dd <BS>
imap kk <Delete>
" The time it takes to detect double key taps
set timeoutlen=280

set listchars=tab:>-,trail:-,nbsp:+ "This is terminal friendly but you can make fancy set list
set list


"--- Fix anoying cut paste
noremap P "0p
" Shift p  pastes the copy register
"--- End Fix anoying cut paste

" access registers with a lil shortcut
noremap A "a
noremap B "b
noremap C "c


" highlight matched
set hlsearch
" case insensitive search
set ignorecase
set smartcase
" search while typing
set incsearch
" wrap-around when searching
set wrapscan
" Rounds the indent spacing to the next multiple of shiftwidth
"set shiftround

"Ctrl-j - Move current line down
"Ctrl-k - Move current line up
" Works even with visually highlighted chunks of text
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 15
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore | wincmd p
"augroup END


autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" Lines below are recommended settings for YCM:
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string

"Want to hide .pyc files? Then add the following line:
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"limited syntax mode for better performance 
let g:NERDTreeLimitedSyntax = 1
"nnoremap <C-n> :NERDTree<CR>
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

let g:jedi#goto_command = "<C-LeftMouse>"
let g:NERDTreeGitStatusUseNerdFonts = 1

set encoding=UTF-8

call plug#begin('~/.vim/bundle')
Plug 'junegunn/vim-peekaboo'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'valloric/youcompleteme'
"Plug 'preservim/nerdtree'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'

"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'ryanoasis/vim-devicons'
call plug#end()

