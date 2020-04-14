syntax enable
colorscheme onedark

let mapleader=","

" Spaces and tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap

" UI Config
set number
set relativenumber
set showmatch

" Searching
set incsearch					" Incremental search
set hlsearch					" Highlight search result
set ignorecase					" Ignore case
nnoremap <leader><space> :nohlsearch<CR>

" Movement
set relativenumber
nnoremap <C-n> :call NumberToggle()<cr>
nnoremap B ^
nnoremap E $
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>
nnoremap <C-tab>    :tabnext<CR>
nnoremap <C-S-tab>  :tabprevious<CR>

" Misc Shortcuts
command WQ wq
command Wq wq
command W w
command Q q
nnoremap <C-S> :w<CR>
nnoremap <C-Enter> O<Esc>k
nnoremap <S-Enter> o<Esc>k

" History and Scratch
let g:netrw_dirhistmax = 0

" Plugins
call plug#begin("~/.vim/plugged")

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'fatih/vim-go'

call plug#end()

" fzf
nnoremap <C-p> :FZF<CR>


" Custom functions
fun! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

fun! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Autocmd
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
