set nocompatible	" be iMproved, required
filetype off		" required

" Set the runtime path to include Vundle and initializers
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'powerline/powerline'
Plugin 'Valloric/YouCompleteMe'

" All Plugins must be added before this line.
call vundle#end()		" required
filetype plugin indent on	" required

" Brief Vundle Help
" :PluginList		- lists configured plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo	- searches for foo; append `!` to refresh local cache
" :PluginClean		- confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki or FAQ
" Non Plugin stuff below

let mapleader=","

" Colors
colorscheme Tomorrow-Night
syntax enable

" Space and Tabs
set tabstop=4
set softtabstop=4
set nowrap

" UI Config
set number
set showcmd
set wildmenu 		" Autocompletes things like filenames, (i.e. :e !/.vim<TAB>?)
set lazyredraw		" Don't bother redrawing in the middle of macros, speeds them up
set showmatch		" Parentheses/bracket highlighting
set guioptions=t

" Searching
set incsearch					" Incremental search
set hlsearch					" Highlight search result
nnoremap <leader><space> :nohlsearch<CR>

" Code Folding
set foldenable
set foldlevelstart=10	" Start folding after 10
set foldnestmax=10		" Don't fold too much
set foldmethod=indent	" Fold on indents

" Movement
nnoremap B ^
nnoremap E $

" Leader Shortcuts
nnoremap <leader>s :makesession<CR>
nnoremap <leader>a :Ag

" Misc Shortcuts
command WQ wq
command Wq wq
command W w
command Q q

" GVim Stuff. Should maybe refactor this out,
" since it varies a little between gvim and macvim
let g:airline_powerline_fonts = 1
nnoremap <C-V> "+gP			" Paste in normal mode
inoremap <C-V> <ESC><C-V>i	" Paste in insert mode
vnoremap <C-C> "+y			" Copy  in visual mode

" Airline
set laststatus=2
set guifont=Meslo\ LG\ S\ 10

" CtrlP
let g:ctrlp_match_window      = 'bottom,order:tbb'
let g:ctrlp_switch_buffer     = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command      = 'ag %s -l --nocolor --hidden -g ""'

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Custom Functions
function! <SID>StripTrailingWhitespace()
		" Save last search & cursor position
		let _s=@/
		let l = line(".")
		let c = col(".")
		%s/\s/+$//e
		let @/=_s
		call cursor(l, c)
endfunction
 
