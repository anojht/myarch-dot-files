set term=screen-256color




set t_Co=256
set background=dark
" vim-plug (Plugin manager and plugins currently installed)
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-scripts/CSApprox.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/vim-syntastic/syntastic.git'

call plug#end()

" vim-airline theme settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Set vim color scheme and enable airline
set laststatus=2
colorscheme ChocolateLiquor

" Font settings for gvim
set guifont=Iosevka_Nerd_Font:s12

" Display line numbers in vim
set number
set relativenumber

" map , as leader for advanced custom commands
let mapleader = ','

" Set shortcuts for NERDTree
nmap <silent> <leader>o :NERDTreeToggle<cr>
nmap <silent> <leader>c :NERDTreeFind<cr>

" Set NERDTree display 
let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = "\xE2\x96\xB7"
let NERDTreeDirArrowCollapsible = "\xE2\x96\xBC"

" Set the NERDTree fuzzy find searh window
let g:fzf_layout = { 'down': '~25%' }

" Set the NERDTree search shortcut
if isdirectory(".git")
	nmap <silent> <leader>f :GFiles<cr>
else
	nmap <silent> <leader>f :FZF<cr>
endif
