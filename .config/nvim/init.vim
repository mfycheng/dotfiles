syntax enable
colorscheme onedark

let mapleader=","


" Space and Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap

" UI Config
set number
set showcmd
set showmatch
set termguicolors " Seems to fix a lot of the color issues
set guicursor=    " Compensate for the above. Personally don't like skinny cursor.


" Movement
set relativenumber
nnoremap <C-n> :call NumberToggle()<cr>
nnoremap B ^
nnoremap E $
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>
nnoremap <C-tab>    :tabnext<CR>
nnoremap <C-S-tab>  :tabprevious<CR>

" Searching
set incsearch					" Incremental search
set hlsearch					" Highlight search result
set ignorecase					" Ignore case
nnoremap <leader><space> :nohlsearch<CR>

call plug#begin(stdpath('config'), '/plugged')

" Fuzzy Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Language Integration
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Autocompletion
"Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" fzf
nnoremap <C-p> :FZF<CR>

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 0
let g:go_highlight_format_strings = 1

" autocomplete
let g:SuperTabClosePreviewOnPopupClose = 1
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})

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

function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc


" Autocmd
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
